// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// Other Chunking Strategy
///
/// This is returned when the chunking strategy is unknown. Typically, this is because the file was indexed before the `chunking_strategy` concept was introduced in the API.
public struct OtherChunkingStrategyResponseParam: Codable {
    /// Always `other`.
    public var type: `Type`

    /// Always `other`.
    public enum `Type`: String, Codable, CaseIterable {
        case other
    }

    public init(type: `Type`) {
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.type = try values.decode(`Type`.self, forKey: "type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(type, forKey: "type")
    }
}
