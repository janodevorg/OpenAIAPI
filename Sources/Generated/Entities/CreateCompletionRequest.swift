// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct CreateCompletionRequest: Codable {
    /// ID of the model to use. You can use the [List models](/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](/docs/models/overview) for descriptions of them.
    public var model: String
    /// The prompt(s) to generate completions for, encoded as a string, array of strings, array of tokens, or array of token arrays.
    /// 
    /// Note that <|endoftext|> is the document separator that the model sees during training, so if a prompt is not specified the model will generate as if from the beginning of a new document.
    public var prompt: Prompt?
    /// The suffix that comes after a completion of inserted text.
    ///
    /// Example: "test."
    public var suffix: String?
    /// The maximum number of [tokens](/tokenizer) to generate in the completion.
    /// 
    /// The token count of your prompt plus `max_tokens` cannot exceed the model's context length. Most models have a context length of 2048 tokens (except for the newest models, which support 4096).
    ///
    /// Example: 16
    public var maxTokens: Int?
    /// What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
    /// 
    /// We generally recommend altering this or `top_p` but not both.
    public var temperature: Double?
    /// An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
    /// 
    /// We generally recommend altering this or `temperature` but not both.
    public var topP: Double?
    /// How many completions to generate for each prompt.
    /// 
    /// **Note:** Because this parameter generates many completions, it can quickly consume your token quota. Use carefully and ensure that you have reasonable settings for `max_tokens` and `stop`.
    public var n: Int?
    /// Whether to stream back partial progress. If set, tokens will be sent as data-only [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format) as they become available, with the stream terminated by a `data: [DONE]` message.
    public var isStream: Bool
    /// Include the log probabilities on the `logprobs` most likely tokens, as well the chosen tokens. For example, if `logprobs` is 5, the API will return a list of the 5 most likely tokens. The API will always return the `logprob` of the sampled token, so there may be up to `logprobs+1` elements in the response.
    /// 
    /// The maximum value for `logprobs` is 5. If you need more than this, please contact us through our [Help center](https://help.openai.com) and describe your use case.
    public var logprobs: Int?
    /// Echo back the prompt in addition to the completion
    public var isEcho: Bool
    /// Up to 4 sequences where the API will stop generating further tokens. The returned text will not contain the stop sequence.
    public var stop: Stop?
    /// Number between -2.0 and 2.0. Positive values penalize new tokens based on whether they appear in the text so far, increasing the model's likelihood to talk about new topics.
    /// 
    /// [See more information about frequency and presence penalties.](/docs/api-reference/parameter-details)
    public var presencePenalty: Double?
    /// Number between -2.0 and 2.0. Positive values penalize new tokens based on their existing frequency in the text so far, decreasing the model's likelihood to repeat the same line verbatim.
    /// 
    /// [See more information about frequency and presence penalties.](/docs/api-reference/parameter-details)
    public var frequencyPenalty: Double?
    /// Generates `best_of` completions server-side and returns the "best" (the one with the highest log probability per token). Results cannot be streamed.
    /// 
    /// When used with `n`, `best_of` controls the number of candidate completions and `n` specifies how many to return – `best_of` must be greater than `n`.
    /// 
    /// **Note:** Because this parameter generates many completions, it can quickly consume your token quota. Use carefully and ensure that you have reasonable settings for `max_tokens` and `stop`.
    public var bestOf: Int?
    /// Modify the likelihood of specified tokens appearing in the completion.
    /// 
    /// Accepts a json object that maps tokens (specified by their token ID in the GPT tokenizer) to an associated bias value from -100 to 100. You can use this [tokenizer tool](/tokenizer?view=bpe) (which works for both GPT-2 and GPT-3) to convert text to token IDs. Mathematically, the bias is added to the logits generated by the model prior to sampling. The exact effect will vary per model, but values between -1 and 1 should decrease or increase likelihood of selection; values like -100 or 100 should result in a ban or exclusive selection of the relevant token.
    /// 
    /// As an example, you can pass `{"50256": -100}` to prevent the <|endoftext|> token from being generated.
    public var logitBias: [String: AnyJSON]?
    /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    ///
    /// Example: "user-1234"
    public var user: String?

    /// The prompt(s) to generate completions for, encoded as a string, array of strings, array of tokens, or array of token arrays.
    /// 
    /// Note that <|endoftext|> is the document separator that the model sees during training, so if a prompt is not specified the model will generate as if from the beginning of a new document.
    public enum Prompt: Codable {
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

    /// Up to 4 sequences where the API will stop generating further tokens. The returned text will not contain the stop sequence.
    public enum Stop: Codable {
        case string(String)
        case strings([String])

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(String.self) {
                self = .string(value)
            } else if let value = try? container.decode([String].self) {
                self = .strings(value)
            } else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Data could not be decoded as any of the expected types (String, [String])."
                )
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .string(let value): try container.encode(value)
            case .strings(let value): try container.encode(value)
            }
        }
    }

    public init(model: String, prompt: Prompt? = nil, suffix: String? = nil, maxTokens: Int? = nil, temperature: Double? = nil, topP: Double? = nil, n: Int? = nil, isStream: Bool? = nil, logprobs: Int? = nil, isEcho: Bool? = nil, stop: Stop? = nil, presencePenalty: Double? = nil, frequencyPenalty: Double? = nil, bestOf: Int? = nil, logitBias: [String: AnyJSON]? = nil, user: String? = nil) {
        self.model = model
        self.prompt = prompt
        self.suffix = suffix
        self.maxTokens = maxTokens
        self.temperature = temperature
        self.topP = topP
        self.n = n
        self.isStream = isStream ?? false
        self.logprobs = logprobs
        self.isEcho = isEcho ?? false
        self.stop = stop
        self.presencePenalty = presencePenalty
        self.frequencyPenalty = frequencyPenalty
        self.bestOf = bestOf
        self.logitBias = logitBias
        self.user = user
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.model = try values.decode(String.self, forKey: "model")
        self.prompt = try values.decodeIfPresent(Prompt.self, forKey: "prompt")
        self.suffix = try values.decodeIfPresent(String.self, forKey: "suffix")
        self.maxTokens = try values.decodeIfPresent(Int.self, forKey: "max_tokens")
        self.temperature = try values.decodeIfPresent(Double.self, forKey: "temperature")
        self.topP = try values.decodeIfPresent(Double.self, forKey: "top_p")
        self.n = try values.decodeIfPresent(Int.self, forKey: "n")
        self.isStream = try values.decodeIfPresent(Bool.self, forKey: "stream") ?? false
        self.logprobs = try values.decodeIfPresent(Int.self, forKey: "logprobs")
        self.isEcho = try values.decodeIfPresent(Bool.self, forKey: "echo") ?? false
        self.stop = try values.decodeIfPresent(Stop.self, forKey: "stop")
        self.presencePenalty = try values.decodeIfPresent(Double.self, forKey: "presence_penalty")
        self.frequencyPenalty = try values.decodeIfPresent(Double.self, forKey: "frequency_penalty")
        self.bestOf = try values.decodeIfPresent(Int.self, forKey: "best_of")
        self.logitBias = try values.decodeIfPresent([String: AnyJSON].self, forKey: "logit_bias")
        self.user = try values.decodeIfPresent(String.self, forKey: "user")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(model, forKey: "model")
        try values.encodeIfPresent(prompt, forKey: "prompt")
        try values.encodeIfPresent(suffix, forKey: "suffix")
        try values.encodeIfPresent(maxTokens, forKey: "max_tokens")
        try values.encodeIfPresent(temperature, forKey: "temperature")
        try values.encodeIfPresent(topP, forKey: "top_p")
        try values.encodeIfPresent(n, forKey: "n")
        try values.encodeIfPresent(isStream, forKey: "stream")
        try values.encodeIfPresent(logprobs, forKey: "logprobs")
        try values.encodeIfPresent(isEcho, forKey: "echo")
        try values.encodeIfPresent(stop, forKey: "stop")
        try values.encodeIfPresent(presencePenalty, forKey: "presence_penalty")
        try values.encodeIfPresent(frequencyPenalty, forKey: "frequency_penalty")
        try values.encodeIfPresent(bestOf, forKey: "best_of")
        try values.encodeIfPresent(logitBias, forKey: "logit_bias")
        try values.encodeIfPresent(user, forKey: "user")
    }
}
