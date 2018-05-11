package nepfit_3

import Nepfit_3.ClubMember
import Nepfit_3.Role
import Nepfit_3.User
import Nepfit_3.UserRole
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON
import groovy.time.TimeCategory
import org.springframework.web.multipart.commons.CommonsMultipartFile

import java.security.SecureRandom


@Secured('permitAll')
class ClubMemberController {
    def springSecurityService
    def index() {
        if(SpringSecurityUtils.ifAllGranted('ROLE_ADMIN')){
            redirect(controller:"products",action: "member_list")
            return
        }else if(SpringSecurityUtils.ifAllGranted('ROLE_USER')){
            redirect(controller:"clubMember",action: "member_list")
            return
        }else{
            redirect(controller:"clubMember",action: "homePage")
            return
        }
    }

    def showImage(){
        def clubMember = ClubMember.findById(Integer.parseInt(params.id.toString()))
        println"Here!!"+clubMember
        if(!clubMember || !clubMember.image){
            response.sendError(404)
            return
        }

        File file = new File(Constantss.CLUBMEMBER_DIR + clubMember.image)
        FileInputStream fileInputStream = new FileInputStream(file)
        byte[] request_p = fileInputStream.bytes
        response.contentLength = request_p.size()
        OutputStream out = response.outputStream
        out.write(request_p)
        fileInputStream.close()
        out.close()
    }

    def create_member() {
        [clubMemberInstance: new ClubMember()]

    }

    def save() {

        ClubMember clubMember = new ClubMember()
        clubMember.member_name=params.member_name
        String name = params.member_name
        println "Member name: " + clubMember.member_name
        clubMember.height=params.height
        println "Height: " + clubMember.height
        clubMember.weight=params.weight
        println "Weight: " + clubMember.weight
        clubMember.address=params.address
        println "Address: " + clubMember.address
        clubMember.contact=params.contact
        println "Contact: " + clubMember.contact
        clubMember.email=params.email
        String email = params.email
        println "Email: " + clubMember.email
        clubMember.package_type=params.package_type
        println "Package type: " + clubMember.package_type
        String username = params.email as String
        username = username.trim().substring(0, username.trim().indexOf('@'))
        println "username = $username"
        String generatedRandomPassword = new BigInteger(64, new SecureRandom()).toString(32)
        println "generatedRandomPassword = $generatedRandomPassword"
        User newUser = new User()
        newUser.username = username
        newUser.password = generatedRandomPassword
        newUser.save(flush: true, failOnError: true)
        Role role = Role.findByAuthority('ROLE_USER')
        UserRole userRole = new UserRole(user: newUser, role: role)
        userRole.save(flush: true, failOnError: true)
        def bodyOfEmail = "Hello ${name}, \n\nYour credentials for Nepfit have been created:" +
                "\n\n\tUsername: $username" +
                "\n\n\tPassword: $generatedRandomPassword" +
                "\n\nThanks," +
                "\nNepfit";
        sendMail {
            async true
            to email
            subject "Nepfit : Credentials"
            text bodyOfEmail
        }
        clubMember.save(flush: true, failOnError: true)

//        User user = new User()
//        String [] uname = params.email.split('@')
//        print ("------------------User Name -------"+uname[0])
//        user.username = uname[0]
//        user.password = uname[0]+"123"
//        user.save(flush:true)
//
//        Role role = Role.findByAuthority('ROLE_USER')
//        UserRole userRole = new UserRole()
//        userRole.user = user
//        userRole.role = role
//        userRole.save(flush:true)

        def clubMemberImage = request.getFile('clubMemberImage')
        println "Club member Image " + clubMemberImage
        if(clubMemberImage){
            saveImageToDrive(clubMemberImage, clubMember)
        }
        redirect(action: 'member_list')
    }

    def saveImageToDrive(imageFile,newClubMember){
        String extenstion = imageFile.originalFilename.toString()
        def serverImagesDir = new File(Constantss.CLUBMEMBER_DIR)
        if(serverImagesDir.exists()){
            String fileName = newClubMember.id + ".$extenstion"
            File destinationFile = new File(serverImagesDir, fileName)
            newClubMember.image = fileName
            imageFile.transferTo(destinationFile)
            newClubMember.save(flush: true,failOnError: true)
        }
        else{
            println "Some error occured !"
        }
    }


    def member_list() {
        def clubMemberList = ClubMember.findAll()
        clubMemberList.each{ it ->
            Date issued_date = it.issued_date
            println "issued_date = $issued_date"
            def package_type = it.package_type
            Integer no_of_month
            if(package_type == ClubMember?.Packages?.MONTH_1){
                no_of_month = 1
            }
            if(package_type == ClubMember?.Packages?.MONTH_3){
                no_of_month = 3
            }
            if(package_type == ClubMember?.Packages?.MONTH_6){
                no_of_month = 6
            }
            if(package_type == ClubMember?.Packages?.MONTH_12){
                no_of_month = 12
            }
            use(TimeCategory){
                issued_date = issued_date + no_of_month.month
            }
            println "no_of_month = $no_of_month"
            println "issued_date = $issued_date"

            Date todayDate = new Date()
            use(TimeCategory){
                todayDate = todayDate + 0.day
            }

            println "todayDate = $todayDate"
            
            if (issued_date<todayDate){
                println "we re"
                it.status = false
                it.save(flush:true, failOnError: true)
            }
            else{
                it.status = true
                it.save(flush:true, failOnError: true)
            }

        }
        def currentClubMember = ClubMember.findAllByStatus(true)
        def aluminiClubMember = ClubMember.findAllByStatus(false)
        println "currentClubMember = $currentClubMember"
        println "aluminiClubMember = $aluminiClubMember"
//        println "clubMember = $clubMember"
        render(view: 'member_list', model: [currentClubMember:currentClubMember, aluminiClubMember: aluminiClubMember], role:springSecurityService.authentication.getAuthorities()[0].toString())

//        render(view: 'member_list', model: [clubMember:clubMember],role:springSecurityService.authentication.getAuthorities()[0].toString())
    }

    def edit_member() {
        def id = params.id
        def originalMember =ClubMember.get(id)
        [edit: originalMember]
    }


    def update() {
        println("params----------------" + params)
        def id = params.id
        def memberToupdate = ClubMember.get(id)
        def imageExist = params.image
        def okContentType = ['image/png','image/jpg','image/jpeg','image/PNG','image/JPG','image/JPEG']
        if(okContentType.contains(imageExist.contentType)){
            def memberImage = request.getFile('image')
            println "MemberImage " + memberImage
            if(memberImage){
                String filename = memberToupdate.image
                def serverImagesUrl = Constantss.CLUBMEMBER_DIR + filename
                def fileToDelete = new File(serverImagesUrl)
                fileToDelete.delete()
                saveImageToDrive(memberImage, memberToupdate)
            }
        }
        memberToupdate.member_name = params.member_name
        memberToupdate.height = params.height
        memberToupdate.weight = params.weight
        memberToupdate.address = params.address
        memberToupdate.contact = params.contact
        memberToupdate.email = params.email
        memberToupdate.package_type = params.package_type
        memberToupdate.issued_date = params.issued_date
        memberToupdate.save(flush: true)
        redirect(action: "member_list")
    }



    def delete() {
        def id = params.id
        def originalMember = ClubMember.get(id)
        String username = originalMember.email
        username = username.trim().substring(0, username.trim().indexOf('@'))
        def user = User.findByUsername(username)
        def userRole = UserRole.findByUser(user)
        userRole.delete(flush: true)
        user.delete(flush: true)
        originalMember.delete(flush: true)
        redirect(action: "member_list")
    }

    @Secured('permitAll')
    def searchBymember(params)
    {
        def searchTerm = params.search1
        print (searchTerm)
        searchTerm = searchTerm.split()

        def c = ClubMember.createCriteria()

        def results = c.list {

            searchTerm.each { str ->
                and {
                    like ("member_name", "%${str}%")

                }
            }
        }

        [memberList: results]
    }

    def show(){
        def memberInstance = ClubMember.findById(params.id as Long)
        [member: memberInstance]
    }

    def signup(){

    }

    def saveMember(){
        def user =new User(username: params.username,password: params.password)
        user.save(failOnError:true
                ,flush:true)
        def role = Role.findByAuthority('ROLE_USER')
        UserRole.create(user,role,true)
//        redirect(action: "member_list")
    }

    def changePassword()
    {
    }

    def updatePassword(){
        def currentUser = springSecurityService.currentUser
        println "currentUser = $currentUser"
        currentUser.password = params.password
        println "currentUser = $currentUser.password"
        currentUser.save(flush: true)
        redirect(controller: "logout", action: "index")
    }
}
