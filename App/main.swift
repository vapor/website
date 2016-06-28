import Vapor
import VaporMustache


let mustache = VaporMustache.Provider(withIncludes:[
    "header": "Includes/header.mustache",
    "footer": "Includes/footer.mustache"
])


let app = Application(providers: [mustache])

app.get("/") { request in
	return try app.view("home.mustache")
}

app.start()
