package nepfit_3

import Nepfit_3.Role
import Nepfit_3.User
import Nepfit_3.UserRole

class SignupController {

    def index() {

    }
    def signup(){
    }

    def register(){
        def email = params.email
        def password = params.password

        if(email!=null && password!=null){
            def user =  new User(params)
            user.save(flush:true)

            def role = new Role(authority: 'ROLE_USER')
            role.save(flush: true)

            def uid = User.findByEmail(params.email)
            def roleid = Role.findByAuthority('ROLE_USER')
            def urole = new UserRole(user:uid,role:roleid)
            urole.save(flush: true)

            session["user"]=uid
            render view: "index"

        }
    }

}
