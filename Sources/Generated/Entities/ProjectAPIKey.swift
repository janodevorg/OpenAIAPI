// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// Represents an individual API key in a project.
public struct ProjectAPIKey: Codable {
    /// The object type, which is always `organization.project.api_key`
    public var object: Object
    /// The redacted value of the API key
    public var redactedValue: String
    /// The name of the API key
    public var name: String
    /// The Unix timestamp (in seconds) of when the API key was created
    public var createdAt: Int
    /// The identifier, which can be referenced in API endpoints
    public var id: String
    public var owner: Owner

    /// The object type, which is always `organization.project.api_key`
    public enum Object: String, Codable, CaseIterable {
        case organizationProjectAPIKey = "organization.project.api_key"
    }

    public struct Owner: Codable {
        /// `user` or `service_account`
        public var type: `Type`?
        /// Represents an individual user in a project.
        public var user: ProjectUser?
        /// Represents an individual service account in a project.
        public var serviceAccount: ProjectServiceAccount?

        /// `user` or `service_account`
        public enum `Type`: String, Codable, CaseIterable {
            case user
            case serviceAccount = "service_account"
        }

        public init(type: `Type`? = nil, user: ProjectUser? = nil, serviceAccount: ProjectServiceAccount? = nil) {
            self.type = type
            self.user = user
            self.serviceAccount = serviceAccount
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.type = try values.decodeIfPresent(`Type`.self, forKey: "type")
            self.user = try values.decodeIfPresent(ProjectUser.self, forKey: "user")
            self.serviceAccount = try values.decodeIfPresent(ProjectServiceAccount.self, forKey: "service_account")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(type, forKey: "type")
            try values.encodeIfPresent(user, forKey: "user")
            try values.encodeIfPresent(serviceAccount, forKey: "service_account")
        }
    }

    public init(object: Object, redactedValue: String, name: String, createdAt: Int, id: String, owner: Owner) {
        self.object = object
        self.redactedValue = redactedValue
        self.name = name
        self.createdAt = createdAt
        self.id = id
        self.owner = owner
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.object = try values.decode(Object.self, forKey: "object")
        self.redactedValue = try values.decode(String.self, forKey: "redacted_value")
        self.name = try values.decode(String.self, forKey: "name")
        self.createdAt = try values.decode(Int.self, forKey: "created_at")
        self.id = try values.decode(String.self, forKey: "id")
        self.owner = try values.decode(Owner.self, forKey: "owner")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(object, forKey: "object")
        try values.encode(redactedValue, forKey: "redacted_value")
        try values.encode(name, forKey: "name")
        try values.encode(createdAt, forKey: "created_at")
        try values.encode(id, forKey: "id")
        try values.encode(owner, forKey: "owner")
    }
}
