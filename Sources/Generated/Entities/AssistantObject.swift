// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// Assistant
///
/// Represents an `assistant` that can call the model and use tools.
public struct AssistantObject: Codable {
    /// The identifier, which can be referenced in API endpoints.
    public var id: String
    /// The object type, which is always `assistant`.
    public var object: Object
    /// The Unix timestamp (in seconds) for when the assistant was created.
    public var createdAt: Int
    /// The name of the assistant. The maximum length is 256 characters.
    public var name: String?
    /// The description of the assistant. The maximum length is 512 characters.
    public var description: String?
    /// ID of the model to use. You can use the [List models](/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](/docs/models) for descriptions of them.
    public var model: String
    /// The system instructions that the assistant uses. The maximum length is 256,000 characters.
    public var instructions: String?
    /// A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code_interpreter`, `file_search`, or `function`.
    public var tools: [Tool]
    /// A set of resources that are used by the assistant's tools. The resources are specific to the type of tool. For example, the `code_interpreter` tool requires a list of file IDs, while the `file_search` tool requires a list of vector store IDs.
    public var toolResources: ToolResources?
    /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format. Keys can be a maximum of 64 characters long and values can be a maximum of 512 characters long.
    public var metadata: [String: AnyJSON]?
    /// What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
    public var temperature: Double?
    /// An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
    /// 
    /// We generally recommend altering this or temperature but not both.
    public var topP: Double?
    /// Specifies the format that the model must output. Compatible with [GPT-4o](/docs/models#gpt-4o), [GPT-4 Turbo](/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
    /// 
    /// Setting to `{ "type": "json_schema", "json_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](/docs/guides/structured-outputs).
    /// 
    /// Setting to `{ "type": "json_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
    /// 
    /// **Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly "stuck" request. Also note that the message content may be partially cut off if `finish_reason="length"`, which indicates the generation exceeded `max_tokens` or the conversation exceeded the max context length.
    public var responseFormat: AssistantsAPIResponseFormatOption?

    /// The object type, which is always `assistant`.
    public enum Object: String, Codable, CaseIterable {
        case assistant
    }

    public enum Tool: Codable {
        case assistantToolsCode(AssistantToolsCode)
        case assistantToolsFileSearch(AssistantToolsFileSearch)
        case assistantToolsFunction(AssistantToolsFunction)

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(AssistantToolsCode.self) {
                self = .assistantToolsCode(value)
            } else if let value = try? container.decode(AssistantToolsFileSearch.self) {
                self = .assistantToolsFileSearch(value)
            } else if let value = try? container.decode(AssistantToolsFunction.self) {
                self = .assistantToolsFunction(value)
            } else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Data could not be decoded as any of the expected types (AssistantToolsCode, AssistantToolsFileSearch, AssistantToolsFunction)."
                )
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .assistantToolsCode(let value): try container.encode(value)
            case .assistantToolsFileSearch(let value): try container.encode(value)
            case .assistantToolsFunction(let value): try container.encode(value)
            }
        }
    }

    /// A set of resources that are used by the assistant's tools. The resources are specific to the type of tool. For example, the `code_interpreter` tool requires a list of file IDs, while the `file_search` tool requires a list of vector store IDs.
    public struct ToolResources: Codable {
        public var codeInterpreter: CodeInterpreter?
        public var fileSearch: FileSearch?

        public struct CodeInterpreter: Codable {
            /// A list of [file](/docs/api-reference/files) IDs made available to the `code_interpreter`` tool. There can be a maximum of 20 files associated with the tool.
            public var fileIDs: [String]?

            public init(fileIDs: [String]? = nil) {
                self.fileIDs = fileIDs
            }

            public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.fileIDs = try values.decodeIfPresent([String].self, forKey: "file_ids")
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(fileIDs, forKey: "file_ids")
            }
        }

        public struct FileSearch: Codable {
            /// The ID of the [vector store](/docs/api-reference/vector-stores/object) attached to this assistant. There can be a maximum of 1 vector store attached to the assistant.
            public var vectorStoreIDs: [String]?

            public init(vectorStoreIDs: [String]? = nil) {
                self.vectorStoreIDs = vectorStoreIDs
            }

            public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.vectorStoreIDs = try values.decodeIfPresent([String].self, forKey: "vector_store_ids")
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(vectorStoreIDs, forKey: "vector_store_ids")
            }
        }

        public init(codeInterpreter: CodeInterpreter? = nil, fileSearch: FileSearch? = nil) {
            self.codeInterpreter = codeInterpreter
            self.fileSearch = fileSearch
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.codeInterpreter = try values.decodeIfPresent(CodeInterpreter.self, forKey: "code_interpreter")
            self.fileSearch = try values.decodeIfPresent(FileSearch.self, forKey: "file_search")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(codeInterpreter, forKey: "code_interpreter")
            try values.encodeIfPresent(fileSearch, forKey: "file_search")
        }
    }

    public init(id: String, object: Object, createdAt: Int, name: String? = nil, description: String? = nil, model: String, instructions: String? = nil, tools: [Tool], toolResources: ToolResources? = nil, metadata: [String: AnyJSON]? = nil, temperature: Double? = nil, topP: Double? = nil, responseFormat: AssistantsAPIResponseFormatOption? = nil) {
        self.id = id
        self.object = object
        self.createdAt = createdAt
        self.name = name
        self.description = description
        self.model = model
        self.instructions = instructions
        self.tools = tools
        self.toolResources = toolResources
        self.metadata = metadata
        self.temperature = temperature
        self.topP = topP
        self.responseFormat = responseFormat
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(String.self, forKey: "id")
        self.object = try values.decode(Object.self, forKey: "object")
        self.createdAt = try values.decode(Int.self, forKey: "created_at")
        self.name = try values.decodeIfPresent(String.self, forKey: "name")
        self.description = try values.decodeIfPresent(String.self, forKey: "description")
        self.model = try values.decode(String.self, forKey: "model")
        self.instructions = try values.decodeIfPresent(String.self, forKey: "instructions")
        self.tools = try values.decode([Tool].self, forKey: "tools")
        self.toolResources = try values.decodeIfPresent(ToolResources.self, forKey: "tool_resources")
        self.metadata = try values.decodeIfPresent([String: AnyJSON].self, forKey: "metadata")
        self.temperature = try values.decodeIfPresent(Double.self, forKey: "temperature")
        self.topP = try values.decodeIfPresent(Double.self, forKey: "top_p")
        self.responseFormat = try values.decodeIfPresent(AssistantsAPIResponseFormatOption.self, forKey: "response_format")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encode(object, forKey: "object")
        try values.encode(createdAt, forKey: "created_at")
        try values.encodeIfPresent(name, forKey: "name")
        try values.encodeIfPresent(description, forKey: "description")
        try values.encode(model, forKey: "model")
        try values.encodeIfPresent(instructions, forKey: "instructions")
        try values.encode(tools, forKey: "tools")
        try values.encodeIfPresent(toolResources, forKey: "tool_resources")
        try values.encodeIfPresent(metadata, forKey: "metadata")
        try values.encodeIfPresent(temperature, forKey: "temperature")
        try values.encodeIfPresent(topP, forKey: "top_p")
        try values.encodeIfPresent(responseFormat, forKey: "response_format")
    }
}
