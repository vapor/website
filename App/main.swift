import Vapor
import VaporMustache

let app = Application()

app.get("/") { request in
	return try app.view("home.mustache")
}

app.providers.append(VaporMustache.Provider(withIncludes:[
	"header": "Includes/header.mustache",
    "footer": "Includes/footer.mustache"
]))

app.start()
