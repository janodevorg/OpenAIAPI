// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// Assistant message
///
/// Messages sent by the model in response to user messages.
public struct ChatCompletionRequestAssistantMessage: Codable {
    /// The contents of the assistant message. Required unless `tool_calls` or `function_call` is specified.
    public var content: Content?
    /// The refusal message by the assistant.
    public var refusal: String?
    /// The role of the messages author, in this case `assistant`.
    public var role: Role
    /// An optional name for the participant. Provides the model information to differentiate between participants of the same role.
    public var name: String?
    /// Data about a previous audio response from the model. 
    /// [Learn more](/docs/guides/audio).
    public var audio: Audio?
    /// The tool calls generated by the model, such as function calls.
    public var toolCalls: [ChatCompletionMessageToolCall]?
    /// Deprecated and replaced by `tool_calls`. The name and arguments of a function that should be called, as generated by the model.
    ///
    /// - warning: Deprecated.
    public var functionCall: FunctionCall?

    /// The contents of the assistant message. Required unless `tool_calls` or `function_call` is specified.
    public enum Content: Codable {
        case string(String)
        case chatCompletionRequestAssistantMessageContentParts([ChatCompletionRequestAssistantMessageContentPart])

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(String.self) {
                self = .string(value)
            } else if let value = try? container.decode([ChatCompletionRequestAssistantMessageContentPart].self) {
                self = .chatCompletionRequestAssistantMessageContentParts(value)
            } else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Data could not be decoded as any of the expected types (String, [ChatCompletionRequestAssistantMessageContentPart])."
                )
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .string(let value): try container.encode(value)
            case .chatCompletionRequestAssistantMessageContentParts(let value): try container.encode(value)
            }
        }
    }

    /// The role of the messages author, in this case `assistant`.
    public enum Role: String, Codable, CaseIterable {
        case assistant
    }

    /// Data about a previous audio response from the model. 
    /// [Learn more](/docs/guides/audio).
    public struct Audio: Codable {
        /// Unique identifier for a previous audio response from the model.
        public var id: String

        public init(id: String) {
            self.id = id
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.id = try values.decode(String.self, forKey: "id")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(id, forKey: "id")
        }
    }

    /// Deprecated and replaced by `tool_calls`. The name and arguments of a function that should be called, as generated by the model.
    @available(*, deprecated, message: "Deprecated")
    public struct FunctionCall: Codable {
        /// The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
        public var arguments: String
        /// The name of the function to call.
        public var name: String

        public init(arguments: String, name: String) {
            self.arguments = arguments
            self.name = name
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.arguments = try values.decode(String.self, forKey: "arguments")
            self.name = try values.decode(String.self, forKey: "name")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(arguments, forKey: "arguments")
            try values.encode(name, forKey: "name")
        }
    }

    public init(content: Content? = nil, refusal: String? = nil, role: Role, name: String? = nil, audio: Audio? = nil, toolCalls: [ChatCompletionMessageToolCall]? = nil, functionCall: FunctionCall? = nil) {
        self.content = content
        self.refusal = refusal
        self.role = role
        self.name = name
        self.audio = audio
        self.toolCalls = toolCalls
        self.functionCall = functionCall
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.content = try values.decodeIfPresent(Content.self, forKey: "content")
        self.refusal = try values.decodeIfPresent(String.self, forKey: "refusal")
        self.role = try values.decode(Role.self, forKey: "role")
        self.name = try values.decodeIfPresent(String.self, forKey: "name")
        self.audio = try values.decodeIfPresent(Audio.self, forKey: "audio")
        self.toolCalls = try values.decodeIfPresent([ChatCompletionMessageToolCall].self, forKey: "tool_calls")
        self.functionCall = try values.decodeIfPresent(FunctionCall.self, forKey: "function_call")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(content, forKey: "content")
        try values.encodeIfPresent(refusal, forKey: "refusal")
        try values.encode(role, forKey: "role")
        try values.encodeIfPresent(name, forKey: "name")
        try values.encodeIfPresent(audio, forKey: "audio")
        try values.encodeIfPresent(toolCalls, forKey: "tool_calls")
        try values.encodeIfPresent(functionCall, forKey: "function_call")
    }
}
