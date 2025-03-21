// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct ChatCompletionTool: Codable {
    /// The type of the tool. Currently, only `function` is supported.
    public var type: `Type`
    public var function: FunctionObject

    /// The type of the tool. Currently, only `function` is supported.
    public enum `Type`: String, Codable, CaseIterable {
        case function
    }

    public init(type: `Type`, function: FunctionObject) {
        self.type = type
        self.function = function
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.type = try values.decode(`Type`.self, forKey: "type")
        self.function = try values.decode(FunctionObject.self, forKey: "function")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(type, forKey: "type")
        try values.encode(function, forKey: "function")
    }
}
