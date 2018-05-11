package Nepfit_3

class Products {
    String image
    String name
    String description
    String price
    static constraints = {
        image(blank:true, nullable: true)
    }
}
