import Vapor

func routes(_ app: Application) throws {

    app.get { req -> String in
        return "It, Works!"
    }
    app.get("hello") { req -> String in
        return "Hello, world!"
    }
}
