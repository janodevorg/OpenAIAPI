// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// Returned when a new content part is added to an assistant message item during
/// response generation.
public struct RealtimeServerEventResponseContentPartAdded: Codable {
    /// The unique ID of the server event.
    public var eventID: String
    /// The event type, must be `response.content_part.added`.
    public var type: `Type`
    /// The ID of the response.
    public var responseID: String
    /// The ID of the item to which the content part was added.
    public var itemID: String
    /// The index of the output item in the response.
    public var outputIndex: Int
    /// The index of the content part in the item's content array.
    public var contentIndex: Int
    /// The content part that was added.
    public var part: Part

    /// The event type, must be `response.content_part.added`.
    public enum `Type`: String, Codable, CaseIterable {
        case responseContentPartAdded = "response.content_part.added"
    }

    /// The content part that was added.
    public struct Part: Codable {
        /// The content type ("text", "audio").
        public var type: `Type`?
        /// The text content (if type is "text").
        public var text: String?
        /// Base64-encoded audio data (if type is "audio").
        public var audio: String?
        /// The transcript of the audio (if type is "audio").
        public var transcript: String?

        /// The content type ("text", "audio").
        public enum `Type`: String, Codable, CaseIterable {
            case audio
            case text
        }

        public init(type: `Type`? = nil, text: String? = nil, audio: String? = nil, transcript: String? = nil) {
            self.type = type
            self.text = text
            self.audio = audio
            self.transcript = transcript
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.type = try values.decodeIfPresent(`Type`.self, forKey: "type")
            self.text = try values.decodeIfPresent(String.self, forKey: "text")
            self.audio = try values.decodeIfPresent(String.self, forKey: "audio")
            self.transcript = try values.decodeIfPresent(String.self, forKey: "transcript")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(type, forKey: "type")
            try values.encodeIfPresent(text, forKey: "text")
            try values.encodeIfPresent(audio, forKey: "audio")
            try values.encodeIfPresent(transcript, forKey: "transcript")
        }
    }

    public init(eventID: String, type: `Type`, responseID: String, itemID: String, outputIndex: Int, contentIndex: Int, part: Part) {
        self.eventID = eventID
        self.type = type
        self.responseID = responseID
        self.itemID = itemID
        self.outputIndex = outputIndex
        self.contentIndex = contentIndex
        self.part = part
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.eventID = try values.decode(String.self, forKey: "event_id")
        self.type = try values.decode(`Type`.self, forKey: "type")
        self.responseID = try values.decode(String.self, forKey: "response_id")
        self.itemID = try values.decode(String.self, forKey: "item_id")
        self.outputIndex = try values.decode(Int.self, forKey: "output_index")
        self.contentIndex = try values.decode(Int.self, forKey: "content_index")
        self.part = try values.decode(Part.self, forKey: "part")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(eventID, forKey: "event_id")
        try values.encode(type, forKey: "type")
        try values.encode(responseID, forKey: "response_id")
        try values.encode(itemID, forKey: "item_id")
        try values.encode(outputIndex, forKey: "output_index")
        try values.encode(contentIndex, forKey: "content_index")
        try values.encode(part, forKey: "part")
    }
}
