// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct Model: Codable {
    public var id: String
    public var object: String
    public var created: Int
    public var ownedBy: String

    public init(id: String, object: String, created: Int, ownedBy: String) {
        self.id = id
        self.object = object
        self.created = created
        self.ownedBy = ownedBy
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(String.self, forKey: "id")
        self.object = try values.decode(String.self, forKey: "object")
        self.created = try values.decode(Int.self, forKey: "created")
        self.ownedBy = try values.decode(String.self, forKey: "owned_by")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encode(object, forKey: "object")
        try values.encode(created, forKey: "created")
        try values.encode(ownedBy, forKey: "owned_by")
    }
}
