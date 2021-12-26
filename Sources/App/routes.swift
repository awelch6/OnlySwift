import Vapor

func routes(_ app: Application) throws {
    try app.register(collection: HomeController())

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
}
