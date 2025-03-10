// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct ChatCompletionMessageToolCall: Codable {
    /// The ID of the tool call.
    public var id: String
    /// The type of the tool. Currently, only `function` is supported.
    public var type: `Type`
    /// The function that the model called.
    public var function: Function

    /// The type of the tool. Currently, only `function` is supported.
    public enum `Type`: String, Codable, CaseIterable {
        case function
    }

    /// The function that the model called.
    public struct Function: Codable {
        /// The name of the function to call.
        public var name: String
        /// The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
        public var arguments: String

        public init(name: String, arguments: String) {
            self.name = name
            self.arguments = arguments
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.name = try values.decode(String.self, forKey: "name")
            self.arguments = try values.decode(String.self, forKey: "arguments")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(name, forKey: "name")
            try values.encode(arguments, forKey: "arguments")
        }
    }

    public init(id: String, type: `Type`, function: Function) {
        self.id = id
        self.type = type
        self.function = function
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(String.self, forKey: "id")
        self.type = try values.decode(`Type`.self, forKey: "type")
        self.function = try values.decode(Function.self, forKey: "function")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encode(type, forKey: "type")
        try values.encode(function, forKey: "function")
    }
}
