import Vapor

final class InfoUpdateRequest: Content {
    var id: Int
    var name: String
    var internalIP: String
    var temperature: String
}
