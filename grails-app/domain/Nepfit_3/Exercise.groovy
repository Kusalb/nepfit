package Nepfit_3

class Exercise {
    String image
    String exercise_name
    String description
    String author
    Date created = new Date()

    static constraints = {
        image(blank:true, nullable: true)
    }


}
