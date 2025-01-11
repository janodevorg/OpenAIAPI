// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// Represents a project rate limit config.
public struct ProjectRateLimit: Codable {
    /// The object type, which is always `project.rate_limit`
    public var object: Object
    /// The identifier, which can be referenced in API endpoints.
    public var id: String
    /// The model this rate limit applies to.
    public var model: String
    /// The maximum requests per minute.
    public var maxRequestsPer1Minute: Int
    /// The maximum tokens per minute.
    public var maxTokensPer1Minute: Int
    /// The maximum images per minute. Only present for relevant models.
    public var maxImagesPer1Minute: Int?
    /// The maximum audio megabytes per minute. Only present for relevant models.
    public var maxAudioMegabytesPer1Minute: Int?
    /// The maximum requests per day. Only present for relevant models.
    public var maxRequestsPer1Day: Int?
    /// The maximum batch input tokens per day. Only present for relevant models.
    public var batch1DayMaxInputTokens: Int?

    /// The object type, which is always `project.rate_limit`
    public enum Object: String, Codable, CaseIterable {
        case projectRateLimit = "project.rate_limit"
    }

    public init(object: Object, id: String, model: String, maxRequestsPer1Minute: Int, maxTokensPer1Minute: Int, maxImagesPer1Minute: Int? = nil, maxAudioMegabytesPer1Minute: Int? = nil, maxRequestsPer1Day: Int? = nil, batch1DayMaxInputTokens: Int? = nil) {
        self.object = object
        self.id = id
        self.model = model
        self.maxRequestsPer1Minute = maxRequestsPer1Minute
        self.maxTokensPer1Minute = maxTokensPer1Minute
        self.maxImagesPer1Minute = maxImagesPer1Minute
        self.maxAudioMegabytesPer1Minute = maxAudioMegabytesPer1Minute
        self.maxRequestsPer1Day = maxRequestsPer1Day
        self.batch1DayMaxInputTokens = batch1DayMaxInputTokens
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.object = try values.decode(Object.self, forKey: "object")
        self.id = try values.decode(String.self, forKey: "id")
        self.model = try values.decode(String.self, forKey: "model")
        self.maxRequestsPer1Minute = try values.decode(Int.self, forKey: "max_requests_per_1_minute")
        self.maxTokensPer1Minute = try values.decode(Int.self, forKey: "max_tokens_per_1_minute")
        self.maxImagesPer1Minute = try values.decodeIfPresent(Int.self, forKey: "max_images_per_1_minute")
        self.maxAudioMegabytesPer1Minute = try values.decodeIfPresent(Int.self, forKey: "max_audio_megabytes_per_1_minute")
        self.maxRequestsPer1Day = try values.decodeIfPresent(Int.self, forKey: "max_requests_per_1_day")
        self.batch1DayMaxInputTokens = try values.decodeIfPresent(Int.self, forKey: "batch_1_day_max_input_tokens")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(object, forKey: "object")
        try values.encode(id, forKey: "id")
        try values.encode(model, forKey: "model")
        try values.encode(maxRequestsPer1Minute, forKey: "max_requests_per_1_minute")
        try values.encode(maxTokensPer1Minute, forKey: "max_tokens_per_1_minute")
        try values.encodeIfPresent(maxImagesPer1Minute, forKey: "max_images_per_1_minute")
        try values.encodeIfPresent(maxAudioMegabytesPer1Minute, forKey: "max_audio_megabytes_per_1_minute")
        try values.encodeIfPresent(maxRequestsPer1Day, forKey: "max_requests_per_1_day")
        try values.encodeIfPresent(batch1DayMaxInputTokens, forKey: "batch_1_day_max_input_tokens")
    }
}
