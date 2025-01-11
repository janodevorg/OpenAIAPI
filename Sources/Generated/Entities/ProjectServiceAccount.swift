// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// Represents an individual service account in a project.
public struct ProjectServiceAccount: Codable {
    /// The object type, which is always `organization.project.service_account`
    public var object: Object
    /// The identifier, which can be referenced in API endpoints
    public var id: String
    /// The name of the service account
    public var name: String
    /// `owner` or `member`
    public var role: Role
    /// The Unix timestamp (in seconds) of when the service account was created
    public var createdAt: Int

    /// The object type, which is always `organization.project.service_account`
    public enum Object: String, Codable, CaseIterable {
        case organizationProjectServiceAccount = "organization.project.service_account"
    }

    /// `owner` or `member`
    public enum Role: String, Codable, CaseIterable {
        case owner
        case member
    }

    public init(object: Object, id: String, name: String, role: Role, createdAt: Int) {
        self.object = object
        self.id = id
        self.name = name
        self.role = role
        self.createdAt = createdAt
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.object = try values.decode(Object.self, forKey: "object")
        self.id = try values.decode(String.self, forKey: "id")
        self.name = try values.decode(String.self, forKey: "name")
        self.role = try values.decode(Role.self, forKey: "role")
        self.createdAt = try values.decode(Int.self, forKey: "created_at")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(object, forKey: "object")
        try values.encode(id, forKey: "id")
        try values.encode(name, forKey: "name")
        try values.encode(role, forKey: "role")
        try values.encode(createdAt, forKey: "created_at")
    }
}
