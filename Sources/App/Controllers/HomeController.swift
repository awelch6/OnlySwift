import Vapor

struct HomeController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        routes.get(use: index)
    }
    
    func index(req: Request) throws {

    }
}
