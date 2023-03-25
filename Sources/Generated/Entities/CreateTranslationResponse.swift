// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct CreateTranslationResponse: Codable {
    public var text: String

    public init(text: String) {
        self.text = text
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.text = try values.decode(String.self, forKey: "text")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(text, forKey: "text")
    }
}
