import Vapor

final class RPiController {
    func index(_ req: Request) throws -> Future<[RaspberryPiInfo]> {
        return RaspberryPiInfo.query(on: req).all()
    }

    func create(_ req: Request) throws -> Future<RaspberryPiInfo> {
        return try req.content.decode(InfoUpdateRequest.self).flatMap { info in
            return RaspberryPiInfo.find(info.id, on: req).flatMap { findPi in
                if let pi = findPi {
                    pi.externalIP = req.http.remotePeer.hostname ?? "Unable to determine External IP"
                    pi.updatedAt = Date()
                    return pi.save(on: req)
                }

                return RaspberryPiInfo(id: info.id,
                                       name: info.name,
                                       internalIP: info.internalIP,
                                       temp: info.temperature,
                                       externalIP: req.http.remotePeer.hostname ?? "Unable to determine External IP",
                                       updatedAt: Date()).create(on: req)
            }
        }
    }
}
