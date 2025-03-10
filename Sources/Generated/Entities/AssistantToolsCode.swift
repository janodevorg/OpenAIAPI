// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// Code interpreter tool
public struct AssistantToolsCode: Codable {
    /// The type of tool being defined: `code_interpreter`
    public var type: `Type`

    /// The type of tool being defined: `code_interpreter`
    public enum `Type`: String, Codable, CaseIterable {
        case codeInterpreter = "code_interpreter"
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
