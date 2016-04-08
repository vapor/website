import Vapor
import VaporZewoMustache

let app = Application()

app.get("/") { request in
	return try app.view("home.mustache")
}

app.providers.append(VaporZewoMustache.Provider(withIncludes:[
	"header": "Includes/header.mustache",
    "footer": "Includes/footer.mustache"
]))

app.start(port: 8080)
