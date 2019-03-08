import FluentSQLite
import Vapor

final class RaspberryPiInfo: SQLiteModel {
    var id: Int?
    var name: String
    var internalIP: String
    var temp: String
    var externalIP: String
    var updatedAt: Date

    init(id: Int?, name: String, internalIP: String, temp: String, externalIP: String, updatedAt: Date) {
        self.id = id
        self.name = name
        self.internalIP = internalIP
        self.temp = temp
        self.externalIP = externalIP
        self.updatedAt = updatedAt
    }
}

extension RaspberryPiInfo: Migration { }
extension RaspberryPiInfo: Content { }
extension RaspberryPiInfo: Parameter { }
