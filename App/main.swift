import Vapor

let drop = Droplet()

drop.get("/") { request in
	return try drop.view("home.mustache")
}

drop.serve()
