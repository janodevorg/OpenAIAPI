// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct CreateEmbeddingResponse: Codable {
    public var object: String
    public var model: String
    public var data: [Datum]
    public var usage: Usage

    public struct Datum: Codable {
        public var index: Int
        public var object: String
        public var embedding: [Double]

        public init(index: Int, object: String, embedding: [Double]) {
            self.index = index
            self.object = object
            self.embedding = embedding
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.index = try values.decode(Int.self, forKey: "index")
            self.object = try values.decode(String.self, forKey: "object")
            self.embedding = try values.decode([Double].self, forKey: "embedding")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(index, forKey: "index")
            try values.encode(object, forKey: "object")
            try values.encode(embedding, forKey: "embedding")
        }
    }

    public struct Usage: Codable {
        public var promptTokens: Int
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

    public init(object: String, model: String, data: [Datum], usage: Usage) {
        self.object = object
        self.model = model
        self.data = data
        self.usage = usage
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.object = try values.decode(String.self, forKey: "object")
        self.model = try values.decode(String.self, forKey: "model")
        self.data = try values.decode([Datum].self, forKey: "data")
        self.usage = try values.decode(Usage.self, forKey: "usage")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(object, forKey: "object")
        try values.encode(model, forKey: "model")
        try values.encode(data, forKey: "data")
        try values.encode(usage, forKey: "usage")
    }
}
