// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// The service account that performed the audit logged action.
public struct AuditLogActorServiceAccount: Codable {
    /// The service account id.
    public var id: String?

    public init(id: String? = nil) {
        self.id = id
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decodeIfPresent(String.self, forKey: "id")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(id, forKey: "id")
    }
}
