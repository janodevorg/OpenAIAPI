// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct ModifyMessageRequest: Codable {
    /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format. Keys can be a maximum of 64 characters long and values can be a maximum of 512 characters long.
    public var metadata: [String: AnyJSON]?

    public init(metadata: [String: AnyJSON]? = nil) {
        self.metadata = metadata
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.metadata = try values.decodeIfPresent([String: AnyJSON].self, forKey: "metadata")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(metadata, forKey: "metadata")
    }
}
