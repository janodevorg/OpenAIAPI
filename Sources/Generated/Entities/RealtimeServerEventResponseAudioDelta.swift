// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// Returned when the model-generated audio is updated.
public struct RealtimeServerEventResponseAudioDelta: Codable {
    /// The unique ID of the server event.
    public var eventID: String
    /// The event type, must be `response.audio.delta`.
    public var type: `Type`
    /// The ID of the response.
    public var responseID: String
    /// The ID of the item.
    public var itemID: String
    /// The index of the output item in the response.
    public var outputIndex: Int
    /// The index of the content part in the item's content array.
    public var contentIndex: Int
    /// Base64-encoded audio data delta.
    public var delta: String

    /// The event type, must be `response.audio.delta`.
    public enum `Type`: String, Codable, CaseIterable {
        case responseAudioDelta = "response.audio.delta"
    }

    public init(eventID: String, type: `Type`, responseID: String, itemID: String, outputIndex: Int, contentIndex: Int, delta: String) {
        self.eventID = eventID
        self.type = type
        self.responseID = responseID
        self.itemID = itemID
        self.outputIndex = outputIndex
        self.contentIndex = contentIndex
        self.delta = delta
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.eventID = try values.decode(String.self, forKey: "event_id")
        self.type = try values.decode(`Type`.self, forKey: "type")
        self.responseID = try values.decode(String.self, forKey: "response_id")
        self.itemID = try values.decode(String.self, forKey: "item_id")
        self.outputIndex = try values.decode(Int.self, forKey: "output_index")
        self.contentIndex = try values.decode(Int.self, forKey: "content_index")
        self.delta = try values.decode(String.self, forKey: "delta")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(eventID, forKey: "event_id")
        try values.encode(type, forKey: "type")
        try values.encode(responseID, forKey: "response_id")
        try values.encode(itemID, forKey: "item_id")
        try values.encode(outputIndex, forKey: "output_index")
        try values.encode(contentIndex, forKey: "content_index")
        try values.encode(delta, forKey: "delta")
    }
}
