import FluentSQLite
import Vapor

final class RaspberryPiInfo: SQLiteModel {
    var id: Int?
    var name: String
    var internalIP: String
    var temp: String
    var externalIP: String?
    var updatedAt: Date?

    init(id: Int? = nil, name: String, internalIP: String, temp: String) {
        self.id = id
        self.name = name
        self.internalIP = internalIP
        self.temp = temp
    }
}

extension RaspberryPiInfo: Migration { }
extension RaspberryPiInfo: Content { }
extension RaspberryPiInfo: Parameter { }
