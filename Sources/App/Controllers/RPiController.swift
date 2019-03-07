import Vapor

/// Controls basic CRUD operations on `Todo`s.
final class RPiController {
    /// Returns a list of all `Todo`s.
    func index(_ req: Request) throws -> Future<[RaspberryPiInfo]> {
        return RaspberryPiInfo.query(on: req).all()
    }

    /// Saves a decoded `Todo` to the database.
    func create(_ req: Request) throws -> Future<RaspberryPiInfo> {
        return try req.content.decode(RaspberryPiInfo.self).flatMap { rPiInfo in
            rPiInfo.externalIP = req.http.remotePeer.hostname ?? "Unable to determine External IP"
            rPiInfo.updatedAt = Date()
//            let info = RaspberryPiInfo.find()
            return rPiInfo.create(on: req)
        }
    }
}
