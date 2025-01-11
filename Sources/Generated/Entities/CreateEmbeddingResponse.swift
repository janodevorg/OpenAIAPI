// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct CreateEmbeddingResponse: Codable {
    /// The list of embeddings generated by the model.
    public var data: [Embedding]
    /// The name of the model used to generate the embedding.
    public var model: String
    /// The object type, which is always "list".
    public var object: Object
    /// The usage information for the request.
    public var usage: Usage

    /// The object type, which is always "list".
    public enum Object: String, Codable, CaseIterable {
        case list
    }

    /// The usage information for the request.
    public struct Usage: Codable {
        /// The number of tokens used by the prompt.
        public var promptTokens: Int
        /// The total number of tokens used by the request.
        public var totalTokens: Int

        public init(promptTokens: Int, totalTokens: Int) {
            self.promptTokens = promptTokens
            self.totalTokens = totalTokens
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.promptTokens = try values.decode(Int.self, forKey: "prompt_tokens")
            self.totalTokens = try values.decode(Int.self, forKey: "total_tokens")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(promptTokens, forKey: "prompt_tokens")
            try values.encode(totalTokens, forKey: "total_tokens")
        }
    }

    public init(data: [Embedding], model: String, object: Object, usage: Usage) {
        self.data = data
        self.model = model
        self.object = object
        self.usage = usage
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.data = try values.decode([Embedding].self, forKey: "data")
        self.model = try values.decode(String.self, forKey: "model")
        self.object = try values.decode(Object.self, forKey: "object")
        self.usage = try values.decode(Usage.self, forKey: "usage")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(data, forKey: "data")
        try values.encode(model, forKey: "model")
        try values.encode(object, forKey: "object")
        try values.encode(usage, forKey: "usage")
    }
}
