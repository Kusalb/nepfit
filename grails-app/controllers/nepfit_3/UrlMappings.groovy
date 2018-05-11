package nepfit_3

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "products",action:"index")
//"/"(view: '/main')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
