// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// Returned when an earlier assistant audio message item is truncated by the 
/// client with a `conversation.item.truncate` event. This event is used to 
/// synchronize the server's understanding of the audio with the client's playback.
/// 
/// This action will truncate the audio and remove the server-side text transcript 
/// to ensure there is no text in the context that hasn't been heard by the user.
public struct RealtimeServerEventConversationItemTruncated: Codable {
    /// The unique ID of the server event.
    public var eventID: String
    /// The event type, must be `conversation.item.truncated`.
    public var type: `Type`
    /// The ID of the assistant message item that was truncated.
    public var itemID: String
    /// The index of the content part that was truncated.
    public var contentIndex: Int
    /// The duration up to which the audio was truncated, in milliseconds.
    public var audioEndMs: Int

    /// The event type, must be `conversation.item.truncated`.
    public enum `Type`: String, Codable, CaseIterable {
        case conversationItemTruncated = "conversation.item.truncated"
    }

    public init(eventID: String, type: `Type`, itemID: String, contentIndex: Int, audioEndMs: Int) {
        self.eventID = eventID
        self.type = type
        self.itemID = itemID
        self.contentIndex = contentIndex
        self.audioEndMs = audioEndMs
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.eventID = try values.decode(String.self, forKey: "event_id")
        self.type = try values.decode(`Type`.self, forKey: "type")
        self.itemID = try values.decode(String.self, forKey: "item_id")
        self.contentIndex = try values.decode(Int.self, forKey: "content_index")
        self.audioEndMs = try values.decode(Int.self, forKey: "audio_end_ms")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(eventID, forKey: "event_id")
        try values.encode(type, forKey: "type")
        try values.encode(itemID, forKey: "item_id")
        try values.encode(contentIndex, forKey: "content_index")
        try values.encode(audioEndMs, forKey: "audio_end_ms")
    }
}
