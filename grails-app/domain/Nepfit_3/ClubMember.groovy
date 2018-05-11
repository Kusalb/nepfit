package Nepfit_3

class ClubMember {
    String image
    String member_name
    String height
    String weight
    String address
    String contact
    String email



    Packages package_type
    Date issued_date = new Date()
    Boolean status =true

    enum Packages{
        MONTH_1,
        MONTH_3,
        MONTH_6,
        MONTH_12
    }


    static constraints = {
        image(blank:true, nullable: true)
    }
}
