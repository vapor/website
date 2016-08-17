import Vapor
import VaporMustache
import Fluent

let mustache = VaporMustache.Provider(withIncludes:[
    "header": "Includes/header.mustache",
    "footer": "Includes/footer.mustache"
])


let drop = Droplet(initializedProviders: [mustache])

drop.get("/") { request in
	return try drop.view("home.mustache")
}

drop.serve()
