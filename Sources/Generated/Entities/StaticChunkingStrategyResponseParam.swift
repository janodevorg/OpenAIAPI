// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// Static Chunking Strategy
public struct StaticChunkingStrategyResponseParam: Codable {
    /// Always `static`.
    public var type: `Type`
    public var `static`: StaticChunkingStrategy

    /// Always `static`.
    public enum `Type`: String, Codable, CaseIterable {
        case `static`
    }

    public init(type: `Type`, `static`: StaticChunkingStrategy) {
        self.type = type
        self.static = `static`
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.type = try values.decode(`Type`.self, forKey: "type")
        self.static = try values.decode(StaticChunkingStrategy.self, forKey: "static")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(type, forKey: "type")
        try values.encode(`static`, forKey: "static")
    }
}
