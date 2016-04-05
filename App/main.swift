import Vapor
import VaporZewoMustache

let app = Application()

app.get("/") { request in
	return try app.view("home.mustache")
}

//Add includeable files to the Mustache provider
VaporZewoMustache.Provider.includeFiles = [
    "header": "Includes/header.mustache",
    "footer": "Includes/footer.mustache"
]

app.providers.append(VaporZewoMustache.Provider)

app.start(port: 8080)
