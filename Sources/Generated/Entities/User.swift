// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// Represents an individual `user` within an organization.
public struct User: Codable {
    /// The object type, which is always `organization.user`
    public var object: Object
    /// The identifier, which can be referenced in API endpoints
    public var id: String
    /// The name of the user
    public var name: String
    /// The email address of the user
    public var email: String
    /// `owner` or `reader`
    public var role: Role
    /// The Unix timestamp (in seconds) of when the user was added.
    public var addedAt: Int

    /// The object type, which is always `organization.user`
    public enum Object: String, Codable, CaseIterable {
        case organizationUser = "organization.user"
    }

    /// `owner` or `reader`
    public enum Role: String, Codable, CaseIterable {
        case owner
        case reader
    }

    public init(object: Object, id: String, name: String, email: String, role: Role, addedAt: Int) {
        self.object = object
        self.id = id
        self.name = name
        self.email = email
        self.role = role
        self.addedAt = addedAt
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.object = try values.decode(Object.self, forKey: "object")
        self.id = try values.decode(String.self, forKey: "id")
        self.name = try values.decode(String.self, forKey: "name")
        self.email = try values.decode(String.self, forKey: "email")
        self.role = try values.decode(Role.self, forKey: "role")
        self.addedAt = try values.decode(Int.self, forKey: "added_at")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(object, forKey: "object")
        try values.encode(id, forKey: "id")
        try values.encode(name, forKey: "name")
        try values.encode(email, forKey: "email")
        try values.encode(role, forKey: "role")
        try values.encode(addedAt, forKey: "added_at")
    }
}
