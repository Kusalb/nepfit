package nepfit_3

import Nepfit_3.Exercise
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Secured('permitAll')
class ExerciseController {

    def springSecurityService
    def index() {
        if (SpringSecurityUtils.ifAllGranted('ROLE_ADMIN')) {
            redirect(controller: "exercise", action: "exercise_list")
            return
        } else if (SpringSecurityUtils.ifAllGranted('ROLE_USER')) {
            redirect(controller: "exercise", action: "exercise_list")
            return
        } else {
            redirect(controller: "exercise", action: "homePage")
            return
        }
    }

    def showImage(){
        def exercise = Exercise.findById(Integer.parseInt(params.id.toString()))
        println"Here!!"+exercise
        if(!exercise || !exercise.image){
            response.sendError(404)
            return
        }

        File file = new File(Constantss.EXERCISE_DIR + exercise.image)
        FileInputStream fileInputStream = new FileInputStream(file)
        byte[] request_p = fileInputStream.bytes
        response.contentLength = request_p.size()
        OutputStream out = response.outputStream
        out.write(request_p)
        fileInputStream.close()
        out.close()
    }
    def create_exercise(){
        [exerciseInstance: new Exercise()]
    }

    def save()
    {
        Exercise exercise = new Exercise()
        exercise.exercise_name = params.exercise_name
        println "Execrise Name: "+ exercise.exercise_name
        exercise.description=params.description
        println "Description: " + exercise.description
        exercise.author = params.author
        println "author: "+ exercise.author
        exercise.created = params.created
        println "Created: "+ exercise.created
        exercise.save(flush: true, failOnError: true)
        def exerciseImage = request.getFile('exerciseImage')
        println "Exercise Image " + exerciseImage
        if(exerciseImage){
            saveImageToDrive(exerciseImage, exercise)
        }
        redirect(action: 'exercise_list')
    }
    def saveImageToDrive(imageFile,newExercise){
        String extenstion = imageFile.originalFilename.toString()
        def serverImagesDir = new File(Constantss.EXERCISE_DIR)
        if(serverImagesDir.exists()){
            String fileName = newExercise.id + ".$extenstion"
            File destinationFile = new File(serverImagesDir, fileName)
            newExercise.image = fileName
            imageFile.transferTo(destinationFile)
            newExercise.save(flush: true,failOnError: true)
        }
        else{
            println "Some error occured !"
        }
    }



    def exercise_list()
    {
        def exercise = Exercise.all

        println("------------------------------------"+springSecurityService.authentication.getAuthorities()[0].toString())
        render(view: 'exercise_list', model: [exercise:exercise],role:springSecurityService.authentication.getAuthorities()[0].toString())
    }

    def edit_exercise()
    {
        def id =params.id
        def originalExercise=Exercise.get(id)
        [edit:originalExercise]
    }


    def update(){
        def id = params.id
        def exerciseToUpdate = Exercise.get(id)
        def imageExist = params.image
    def okContentType = ['image/png','image/jpg','image/jpeg','image/PNG','image/JPG','image/JPEG']
    if(okContentType.contains(imageExist.contentType)){
        def exerciseImage = request.getFile('image')
        println "ExerciseImage " + exerciseImage
        if(exerciseImage){
            String filename = exerciseToUpdate.image
            def serverImagesUrl = Constantss.EXERCISE_DIR + filename
            def fileToDelete = new File(serverImagesUrl)
            fileToDelete.delete()
            saveImageToDrive(exerciseImage, exerciseToUpdate)
        }
    }

        exerciseToUpdate.exercise_name = params.exercise_name
        exerciseToUpdate.description = params.description
        exerciseToUpdate.created = params.created
        exerciseToUpdate.author = params.author
        exerciseToUpdate.save(flush:true)
        redirect(action:"exercise_list")
    }

//  /*  def id = params.id
//    def blogToUpdate = Blog.get(id)
//    def imageExist = params.image
//    def okContentType = ['image/png','image/jpg','image/jpeg','image/PNG','image/JPG','image/JPEG']
//    if(okContentType.contains(imageExist.contentType)){
//        def blogImage = request.getFile('image')
//        println "BlogImage " + blogImage
//        if(blogImage){
//            String filename = blogToUpdate.image
//            def serverImagesUrl = Constantss.BLOG_DIR + filename
//            def fileToDelete = new File(serverImagesUrl)
//            fileToDelete.delete()
//            saveImageToDrive(blogImage, blogToUpdate)
//        }
//    }
//    blogToUpdate.description = params.description
//    blogToUpdate.blog_name = params.blog_name
//    blogToUpdate.created = params.created
//    blogToUpdate.author= params.author
//    blogToUpdate.save(flush:true)
//    redirect(action:"blog_list")*/

    def delete()
    {
        def id = params.id
        def originalExercise= Exercise.get(id)
        originalExercise.delete(flush:true)
        redirect(action:"exercise_list")
    }

    @Secured('permitAll')
    def searchByexercise(params)
    {
        def searchTerm = params.search1

        searchTerm = searchTerm.split()

        def c = Exercise.createCriteria()

        def results = c.list {

            searchTerm.each { str ->
                and {
                    like ("exercise_name", "%${str}%")

                }
            }
        }

        [exerciseList: results]
    }

    def show(){
        def exerciseInstance = Exercise.findById(params.id as Long)
        [exercise: exerciseInstance]
    }
}
