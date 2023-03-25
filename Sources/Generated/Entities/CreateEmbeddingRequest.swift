// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct CreateEmbeddingRequest: Codable {
    /// ID of the model to use. You can use the [List models](/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](/docs/models/overview) for descriptions of them.
    public var model: String
    /// Input text to get embeddings for, encoded as a string or array of tokens. To get embeddings for multiple inputs in a single request, pass an array of strings or array of token arrays. Each input must not exceed 8192 tokens in length.
    ///
    /// Example: "The quick brown fox jumped over the lazy dog"
    public var input: Input
    /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    ///
    /// Example: "user-1234"
    public var user: String?

    /// Input text to get embeddings for, encoded as a string or array of tokens. To get embeddings for multiple inputs in a single request, pass an array of strings or array of token arrays. Each input must not exceed 8192 tokens in length.
    ///
    /// Example: "The quick brown fox jumped over the lazy dog"
    public enum Input: Codable {
        case string(String)
        case strings([String])
        case ints([Int])
        case ints2([[Int]])

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(String.self) {
                self = .string(value)
            } else if let value = try? container.decode([String].self) {
                self = .strings(value)
            } else if let value = try? container.decode([Int].self) {
                self = .ints(value)
            } else if let value = try? container.decode([[Int]].self) {
                self = .ints2(value)
            } else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Data could not be decoded as any of the expected types (String, [String], [Int], [[Int]])."
                )
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .string(let value): try container.encode(value)
            case .strings(let value): try container.encode(value)
            case .ints(let value): try container.encode(value)
            case .ints2(let value): try container.encode(value)
            }
        }
    }

    public init(model: String, input: Input, user: String? = nil) {
        self.model = model
        self.input = input
        self.user = user
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.model = try values.decode(String.self, forKey: "model")
        self.input = try values.decode(Input.self, forKey: "input")
        self.user = try values.decodeIfPresent(String.self, forKey: "user")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(model, forKey: "model")
        try values.encode(input, forKey: "input")
        try values.encodeIfPresent(user, forKey: "user")
    }
}
