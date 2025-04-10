// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// Refusal
///
/// The refusal content that is part of a message.
public struct MessageDeltaContentRefusalObject: Codable {
    /// The index of the refusal part in the message.
    public var index: Int
    /// Always `refusal`.
    public var type: `Type`
    public var refusal: String?

    /// Always `refusal`.
    public enum `Type`: String, Codable, CaseIterable {
        case refusal
    }

    public init(index: Int, type: `Type`, refusal: String? = nil) {
        self.index = index
        self.type = type
        self.refusal = refusal
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.index = try values.decode(Int.self, forKey: "index")
        self.type = try values.decode(`Type`.self, forKey: "type")
        self.refusal = try values.decodeIfPresent(String.self, forKey: "refusal")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(index, forKey: "index")
        try values.encode(type, forKey: "type")
        try values.encodeIfPresent(refusal, forKey: "refusal")
    }
}
