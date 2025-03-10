// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct ChatCompletionTokenLogprob: Codable {
    /// The token.
    public var token: String
    /// The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
    public var logprob: Double
    /// A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
    public var bytes: [Int]?
    /// List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top_logprobs` returned.
    public var topLogprobs: [TopLogprob]

    public struct TopLogprob: Codable {
        /// The token.
        public var token: String
        /// The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
        public var logprob: Double
        /// A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
        public var bytes: [Int]?

        public init(token: String, logprob: Double, bytes: [Int]? = nil) {
            self.token = token
            self.logprob = logprob
            self.bytes = bytes
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.token = try values.decode(String.self, forKey: "token")
            self.logprob = try values.decode(Double.self, forKey: "logprob")
            self.bytes = try values.decodeIfPresent([Int].self, forKey: "bytes")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(token, forKey: "token")
            try values.encode(logprob, forKey: "logprob")
            try values.encodeIfPresent(bytes, forKey: "bytes")
        }
    }

    public init(token: String, logprob: Double, bytes: [Int]? = nil, topLogprobs: [TopLogprob]) {
        self.token = token
        self.logprob = logprob
        self.bytes = bytes
        self.topLogprobs = topLogprobs
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.token = try values.decode(String.self, forKey: "token")
        self.logprob = try values.decode(Double.self, forKey: "logprob")
        self.bytes = try values.decodeIfPresent([Int].self, forKey: "bytes")
        self.topLogprobs = try values.decode([TopLogprob].self, forKey: "top_logprobs")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(token, forKey: "token")
        try values.encode(logprob, forKey: "logprob")
        try values.encodeIfPresent(bytes, forKey: "bytes")
        try values.encode(topLogprobs, forKey: "top_logprobs")
    }
}
