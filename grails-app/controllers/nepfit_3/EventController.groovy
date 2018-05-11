package nepfit_3

import Nepfit_3.Event
import grails.converters.JSON
import org.springframework.web.multipart.commons.CommonsMultipartFile
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class EventController {
    def springSecurityService

    def index() {
        if (SpringSecurityUtils.ifAllGranted('ROLE_ADMIN')) {
            redirect(controller: "event", action: "event_list")
            return
        } else if (SpringSecurityUtils.ifAllGranted('ROLE_USER')) {
            redirect(controller: "event", action: "event_list")
            return
        } else {
            redirect(controller: "event", action: "homePage")
            return
        }
    }

    def showImage() {
        def event = Event.findById(Integer.parseInt(params.id.toString()))
        println"Here!!"+event
        if (!event || !event.image) {
            response.sendError(404)
            return
        }

        File file = new File(Constantss.EVENT_DIR + event.image)
        FileInputStream fileInputStream = new FileInputStream(file)
        byte[] request_p = fileInputStream.bytes
        response.contentLength = request_p.size()
        OutputStream out = response.outputStream
        out.write(request_p)
        fileInputStream.close()
        out.close()
    }

    def create_event() {
        [eventInstance: new Event()]
    }

    def save() {
        Event event = new Event()
        event.event_name = params.event_name
        println "Event Name: " + event.event_name
        event.organized_by = params.organized_by
        println "Organized: " + event.organized_by
        event.description = params.description
        println "Description: " + event.description
        event.author = params.author
        println "author: " + event.author
        event.created = params.created
        println "Created: " + event.created
        event.save(flush: true, failOnError: true)
        def eventImage = request.getFile('eventImage')
        println "Event Image " + eventImage
        if (eventImage) {
            saveImageToDrive(eventImage, event)
        }
        redirect(action: 'event_list')
    }

    def saveImageToDrive(imageFile, newEvent) {
        String extenstion = imageFile.originalFilename.toString()
        def serverImagesDir = new File(Constantss.EVENT_DIR)
        if (serverImagesDir.exists()) {
            String fileName = newEvent.id + ".$extenstion"
            File destinationFile = new File(serverImagesDir, fileName)
            newEvent.image = fileName
            imageFile.transferTo(destinationFile)
            newEvent.save(flush: true, failOnError: true)
        } else {
            println "Some error occured !"
        }
    }


    def event_list() {
        def event = Event.all
        render(view: 'event_list', model: [event: event, role: springSecurityService.authentication.getAuthorities()[0].toString()])
    }

    def event_edit() {
        def id = params.id
        def originalEvent = Event.get(id)
        [edit: originalEvent]
    }


    def update() {
        def id = params.id
        def eventToUpdate = Event.get(id)
        def imageExist = params.image
        def okContentType = ['image/png', 'image/jpg', 'image/jpeg', 'image/PNG', 'image/JPG', 'image/JPEG']
        if (okContentType.contains(imageExist.contentType)) {
            def eventImage = request.getFile('image')
            println "EventImage " + eventImage
            if (eventImage) {
                String filename = eventToUpdate.image
                def serverImagesUrl = Constantss.EVENT_DIR + filename
                def fileToDelete = new File(serverImagesUrl)
                fileToDelete.delete()
                saveImageToDrive(eventImage, eventToUpdate)
            }
        }
        eventToUpdate.event_name = params.event_name
        eventToUpdate.organized_by = params.organized_by
        eventToUpdate.description = params.description
        eventToUpdate.author = params.author
        eventToUpdate.created = params.created
        eventToUpdate.save(flush: true)
        redirect(action: "event_list")
    }

    def delete() {
        def id = params.id
        def originalEvent = Event.get(id)

        originalEvent.delete(flush: true)
        redirect(action: "event_list")
    }

    @Secured('permitAll')
    def homePage() {

    }

    def searchByevent(params)
    {
        def searchTerm = params.search1
        print (searchTerm)
        searchTerm = searchTerm.split()

        def c = Event.createCriteria()

        def results = c.list {

            searchTerm.each { str ->
                and {
                    like ("event_name", "%${str}%")

                }
            }
        }

        [eventList: results]
    }

    def show(){
        def eventInstance = Event.findById(params.id as Long)
        [event: eventInstance]
    }

}
