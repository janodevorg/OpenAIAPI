// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// Represents an embedding vector returned by embedding endpoint.
public struct Embedding: Codable {
    /// The index of the embedding in the list of embeddings.
    public var index: Int
    /// The embedding vector, which is a list of floats. The length of vector depends on the model as listed in the [embedding guide](/docs/guides/embeddings).
    public var embedding: [Double]
    /// The object type, which is always "embedding".
    public var object: Object

    /// The object type, which is always "embedding".
    public enum Object: String, Codable, CaseIterable {
        case embedding
    }

    public init(index: Int, embedding: [Double], object: Object) {
        self.index = index
        self.embedding = embedding
        self.object = object
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.index = try values.decode(Int.self, forKey: "index")
        self.embedding = try values.decode([Double].self, forKey: "embedding")
        self.object = try values.decode(Object.self, forKey: "object")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(index, forKey: "index")
        try values.encode(embedding, forKey: "embedding")
        try values.encode(object, forKey: "object")
    }
}
