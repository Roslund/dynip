import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "Super Secret! just kidding, do have a look"
    }

    // Example of configuring a controller
    let rPiController = RPiController()
    router.get("pis", use: rPiController.index)
    router.post("pis", use: rPiController.create)
}
