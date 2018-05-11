package nepfit_3

import Nepfit_3.Blog
import grails.converters.JSON
import org.springframework.web.multipart.commons.CommonsMultipartFile
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class BlogController {
    def springSecurityService
    def index() {
        if (SpringSecurityUtils.ifAllGranted('ROLE_ADMIN')) {
            redirect(controller: "blog", action: "blog_list")
            return
        } else if (SpringSecurityUtils.ifAllGranted('ROLE_USER')) {
            redirect(controller: "blog", action: "blog_list")
            return
        } else {
            redirect(controller: "blog", action: "homePage")
            return
        }
    }

    def showImage(){
        def blog = Blog.findById(Integer.parseInt(params.id.toString()))
        println"Here!!"+blog
        if(!blog || !blog.image){
            response.sendError(404)
            return
        }

        File file = new File(Constantss.BLOG_DIR + blog.image)
        FileInputStream fileInputStream = new FileInputStream(file)
        byte[] request_p = fileInputStream.bytes
        response.contentLength = request_p.size()
        OutputStream out = response.outputStream
        out.write(request_p)
        fileInputStream.close()
        out.close()
    }
    def create_blog(){
        [blogInstance: new Blog()]
    }


 /*
    def create(){
        [blogInstance: new Blog()]
    }*/
 /*   image
    String blog_name
    String description
    String author
    Date created = new Date()*/

    def save(){
        Blog blog = new Blog()
        blog.blog_name=params.blog_name
        println"blog_name:"+blog.blog_name
        blog.description=params.description
        println"Description:"+blog.description
        blog.author=params.author
        println"Author:"+blog.author
        blog.created=params.created
        println"Date:"+blog.created
        blog.save(flush: true, failOnError: true)
        def blogImage = request.getFile('blogImage')
        println "BlogImage " + blogImage
        if(blogImage){
            saveImageToDrive(blogImage, blog)
        }
        redirect(action: 'blog_list')
    }

    def saveImageToDrive(imageFile,newBlog){
        String extenstion = imageFile.originalFilename.toString()
        def serverImagesDir = new File(Constantss.BLOG_DIR)
        if(serverImagesDir.exists()){
            String fileName = newBlog.id + ".$extenstion"
            File destinationFile = new File(serverImagesDir, fileName)
            newBlog.image = fileName
            imageFile.transferTo(destinationFile)
            newBlog.save(flush: true,failOnError: true)
        }
        else{
            println "Some error occured !"
        }
    }

    def blog_list()
    {
        def blog = Blog.all
        render(view: 'blog_list', model: [blog:blog],role:springSecurityService.authentication.getAuthorities()[0].toString())
    }

    def edit_blog()
    {
        def id =params.id
        def originalBlog=Blog.get(id)
        [edit:originalBlog]
    }


    def update(){
        def id = params.id
        def blogToUpdate = Blog.get(id)
        def imageExist = params.image
        def okContentType = ['image/png','image/jpg','image/jpeg','image/PNG','image/JPG','image/JPEG']
        if(okContentType.contains(imageExist.contentType)){
            def blogImage = request.getFile('image')
            println "BlogImage " + blogImage
            if(blogImage){
                String filename = blogToUpdate.image
                def serverImagesUrl = Constantss.BLOG_DIR + filename
                def fileToDelete = new File(serverImagesUrl)
                fileToDelete.delete()
                saveImageToDrive(blogImage, blogToUpdate)
            }
        }
        blogToUpdate.description = params.description
        blogToUpdate.blog_name = params.blog_name
        blogToUpdate.created = params.created
        blogToUpdate.author= params.author
        blogToUpdate.save(flush:true)
        redirect(action:"blog_list")
    }


    def delete()
    {
        def id = params.id
        def originalBlog= Blog.get(id)
        originalBlog.delete(flush:true)
        redirect(action:"blog_list")
    }

    @Secured('permitAll')
    def searchByblog(params)
    {
        def searchTerm = params.search1
        searchTerm = searchTerm.split()

        def c = Blog.createCriteria()

        def results = c.list {

            searchTerm.each { str ->
                and {
                    like ("blog_name", "%${str}%")

                }
            }
        }

        [blogList: results]
    }

    def show(){
        def blogInstance = Blog.findById(params.id as Long)
        [blog: blogInstance]
    }
}
