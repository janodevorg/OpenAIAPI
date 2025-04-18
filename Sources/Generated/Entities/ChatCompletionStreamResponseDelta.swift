// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// A chat completion delta generated by streamed model responses.
public struct ChatCompletionStreamResponseDelta: Codable {
    /// The contents of the chunk message.
    public var content: String?
    /// Deprecated and replaced by `tool_calls`. The name and arguments of a function that should be called, as generated by the model.
    ///
    /// - warning: Deprecated.
    public var functionCall: FunctionCall?
    public var toolCalls: [ChatCompletionMessageToolCallChunk]?
    /// The role of the author of this message.
    public var role: Role?
    /// The refusal message generated by the model.
    public var refusal: String?

    /// Deprecated and replaced by `tool_calls`. The name and arguments of a function that should be called, as generated by the model.
    @available(*, deprecated, message: "Deprecated")
    public struct FunctionCall: Codable {
        /// The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
        public var arguments: String?
        /// The name of the function to call.
        public var name: String?

        public init(arguments: String? = nil, name: String? = nil) {
            self.arguments = arguments
            self.name = name
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.arguments = try values.decodeIfPresent(String.self, forKey: "arguments")
            self.name = try values.decodeIfPresent(String.self, forKey: "name")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(arguments, forKey: "arguments")
            try values.encodeIfPresent(name, forKey: "name")
        }
    }

    /// The role of the author of this message.
    public enum Role: String, Codable, CaseIterable {
        case system
        case user
        case assistant
        case tool
    }

    public init(content: String? = nil, functionCall: FunctionCall? = nil, toolCalls: [ChatCompletionMessageToolCallChunk]? = nil, role: Role? = nil, refusal: String? = nil) {
        self.content = content
        self.functionCall = functionCall
        self.toolCalls = toolCalls
        self.role = role
        self.refusal = refusal
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.content = try values.decodeIfPresent(String.self, forKey: "content")
        self.functionCall = try values.decodeIfPresent(FunctionCall.self, forKey: "function_call")
        self.toolCalls = try values.decodeIfPresent([ChatCompletionMessageToolCallChunk].self, forKey: "tool_calls")
        self.role = try values.decodeIfPresent(Role.self, forKey: "role")
        self.refusal = try values.decodeIfPresent(String.self, forKey: "refusal")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(content, forKey: "content")
        try values.encodeIfPresent(functionCall, forKey: "function_call")
        try values.encodeIfPresent(toolCalls, forKey: "tool_calls")
        try values.encodeIfPresent(role, forKey: "role")
        try values.encodeIfPresent(refusal, forKey: "refusal")
    }
}
