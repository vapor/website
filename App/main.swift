import Vapor
import VaporMustache


let mustache = VaporMustache.Provider(withIncludes:[
    "header": "Includes/header.mustache",
    "footer": "Includes/footer.mustache"
])


let drop = Droplet(providers: [mustache])

drop.get("/") { request in
	return try drop.view("home.mustache")
}

drop.serve()
