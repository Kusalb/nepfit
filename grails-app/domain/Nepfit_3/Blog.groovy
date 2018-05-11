package Nepfit_3

class Blog {
    String image
    String blog_name
    String description
    String author
    Date created = new Date()

    static constraints = {
        image(blank:true, nullable: true)
        description(blank:true, nullable: true)
    }
}
