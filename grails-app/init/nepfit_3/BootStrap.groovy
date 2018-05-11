package nepfit_3

import Nepfit_3.Role
import Nepfit_3.User
import Nepfit_3.UserRole

class BootStrap {

    def init = { servletContext ->
     /*   def admin = new User(username:'admin',password:'admin')
        admin.save(flush:true)

        def user = new User(username:'user',password:'user')
        user.save(flush:true)

        def adminRole = new Role(authority: 'ROLE_ADMIN')
        adminRole.save(flush:true)

        def userRole = new Role(authority: 'ROLE_USER')
        userRole.save(flush:true)

        UserRole.create(admin,adminRole,true)
        UserRole.create(user,userRole,true)*/
        Constantss.PRODUCT_DIR = servletContext.getRealPath("/")+ "productPhoto/"
        Constantss.BLOG_DIR = servletContext.getRealPath("/")+ "blogPhoto/"
        Constantss.EXERCISE_DIR = servletContext.getRealPath("/")+ "exercisePhoto/"
        Constantss.CLUBMEMBER_DIR = servletContext.getRealPath("/")+ "clubmemberPhoto/"
        Constantss.EVENT_DIR = servletContext.getRealPath("/")+ "eventPhoto/"

        (new File(Constantss.PRODUCT_DIR).exists() ?: new File(Constantss.PRODUCT_DIR).mkdir())
        (new File(Constantss.BLOG_DIR).exists() ?: new File(Constantss.BLOG_DIR).mkdir())
        (new File(Constantss.BLOG_DIR).exists() ?: new File(Constantss.EXERCISE_DIR).mkdir())
        (new File(Constantss.CLUBMEMBER_DIR).exists() ?: new File(Constantss.CLUBMEMBER_DIR).mkdir())
        (new File(Constantss.EVENT_DIR).exists() ?: new File(Constantss.EVENT_DIR).mkdir())
    }
    def destroy = {
    }
}
