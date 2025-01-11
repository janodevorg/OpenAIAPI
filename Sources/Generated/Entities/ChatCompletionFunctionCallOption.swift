// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// Specifying a particular function via `{"name": "my_function"}` forces the model to call that function.
public struct ChatCompletionFunctionCallOption: Codable {
    /// The name of the function to call.
    public var name: String

    public init(name: String) {
        self.name = name
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.name = try values.decode(String.self, forKey: "name")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(name, forKey: "name")
    }
}
