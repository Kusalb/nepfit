package nepfit_3

import Nepfit_3.Event
import Nepfit_3.Products
import grails.converters.JSON
import org.springframework.web.multipart.commons.CommonsMultipartFile
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class ProductsController {
def springSecurityService
    def index() {
        if(SpringSecurityUtils.ifAllGranted('ROLE_ADMIN')){
            redirect(controller:"products",action: "list")
            return
        }else if(SpringSecurityUtils.ifAllGranted('ROLE_USER')){
            redirect(controller:"products",action: "list")
            return
        }else{
            redirect(controller:"products",action: "homePage")
            return
        }
    }
    def showImage(){
        def product = Products.findById(Integer.parseInt(params.id.toString()))
        /*println"Here!!"+product*/
        if(!product || !product.image){
            response.sendError(404)
            return
        }

        File file = new File(Constantss.PRODUCT_DIR + product.image)
        FileInputStream fileInputStream = new FileInputStream(file)
        byte[] request_p = fileInputStream.bytes
        response.contentLength = request_p.size()
        OutputStream out = response.outputStream
        out.write(request_p)
        fileInputStream.close()
        out.close()
    }
    def create(){
        [productInstance: new Products()]
    }
    def save(){
        Products product = new Products()
        product.name = params.name
        println "Proudct Name: "+ product.name
        product.price = params.price
        println "Proudct Price: "+ product.price
        product.description = params.description
        println "Proudct Descr: "+ product.description
        product.save(flush: true, failOnError: true)
        def productImage = request.getFile('productImage')
        println "ProductImage " + productImage
        if(productImage){
            saveImageToDrive(productImage, product)
        }
        redirect(action: 'list')
    }

    def saveImageToDrive(imageFile,newProduct){
        String extenstion = imageFile.originalFilename.toString()
        def serverImagesDir = new File(Constantss.PRODUCT_DIR)
        if(serverImagesDir.exists()){
            String fileName = newProduct.id + ".$extenstion"
            File destinationFile = new File(serverImagesDir, fileName)
            newProduct.image = fileName
            imageFile.transferTo(destinationFile)
            newProduct.save(flush: true,failOnError: true)
        }
        else{
            println "Some error occured !"
        }
    }


    def list(){
        def product = Products.all
        render(view: 'list',model: [product:product,role:springSecurityService.authentication.getAuthorities()[0].toString()])
    }

    def edit()
    {
        def id =params.id
        def originalProduct=Products.get(id)
        [edit:originalProduct]
    }


    def update(){
        def id = params.id
        def productToUpdate = Products.get(id)
        def imageExist = params.image
        def okContentType = ['image/png','image/jpg','image/jpeg','image/PNG','image/JPG','image/JPEG']
        if(okContentType.contains(imageExist.contentType)){
            def productImage = request.getFile('image')
            println "ProductImage " + productImage
            if(productImage){
                String filename = productToUpdate.image
                def serverImagesUrl = Constantss.PRODUCT_DIR + filename
                def fileToDelete = new File(serverImagesUrl)
                fileToDelete.delete()
                saveImageToDrive(productImage, productToUpdate)
            }
        }
        productToUpdate.name = params.name
        productToUpdate.price = params.price
        productToUpdate.description = params.description
        productToUpdate.save(flush:true)
        redirect(action:"list")
    }

    def delete()
    {
        def id =params.id
        def originalProduct = Products.get(id)
        
        originalProduct.delete(flush:true)
        redirect(action:"list")
    }

    @Secured('permitAll')
    def homePage(){
        Date today = new Date()
        def event = Event.findAllByCreatedGreaterThanEquals(today)
        [event:event]
    }

//    @Secured('permitAll')
//    def searchByProduct(params) {
//        def searchTerm = params.search
//        searchTerm = searchTerm.split()
//
//        if (params.search != null && params.search1 != null) {
//            def c = Products.createCriteria()
//
//            def results = c.list {
//                and {
//                    like("name", "%${params.search}%")
//                    eq("price", "${params.search1}")
//                }
//                /*searchTerm.each { str ->
//                    and {
//                        like ("name", "%${str}%")
//                        eq("price",${})
//                    }
//                }*/
//            }
//            [productList: results]
//        }
//    }
//        def c = Products.createCriteria()

//        def results = c.list {
//
//            searchTerm.each { str ->
//                and {
//                    like ("name", "%${str}%")
//                }
//            }
//        }
//
//        [productList: results]


    @Secured('permitAll')
    def searchByPrice(params)
    {
        def searchTerm = params.search1
        searchTerm = searchTerm.split()

        def c = Products.createCriteria()

        def results = c.list {

            searchTerm.each { str ->
                and {
                    like ("price", "%${str}%")
                }
            }
        }

        [productList: results]
    }

    @Secured('permitAll')
    def searchByProduct(params)
    {
        def searchTerm = params.search2
        searchTerm = searchTerm.split()

        def c = Products.createCriteria()

        def results = c.list {

            searchTerm.each { str ->
                and {
                    like ("name", "%${str}%")
                }
            }
        }

        [productList: results]
    }



    def bmi(){

    }

    def calculateBmi(){
//        def height = Double.parseDouble(params.height)
//        def weight = Double.parseDouble(params.weight)
//
//        def bmi = ((weight / height)/height)*10000
//        redirect(action: 'bmi', params:[bmi: bmi])
    }

    def show(){
        def eventInstance = Event.findById(params.id as Long)
        [event: eventInstance]
    }

    def showproduct(){
        def productInstance = Products.findById(params.id as Long)
        [product: productInstance]
    }
}
