package Nepfit_3

class Event {
    String image
    String event_name
    String organized_by
    String description
    String author
    Date created = new Date()


    static constraints = {
        image(blank:true, nullable: true)
    }
}
