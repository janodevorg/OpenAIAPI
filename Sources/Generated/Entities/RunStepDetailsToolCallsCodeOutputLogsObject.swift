// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// Code Interpreter log output
///
/// Text output from the Code Interpreter tool call as part of a run step.
public struct RunStepDetailsToolCallsCodeOutputLogsObject: Codable {
    /// Always `logs`.
    public var type: `Type`
    /// The text output from the Code Interpreter tool call.
    public var logs: String

    /// Always `logs`.
    public enum `Type`: String, Codable, CaseIterable {
        case logs
    }

    public init(type: `Type`, logs: String) {
        self.type = type
        self.logs = logs
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.type = try values.decode(`Type`.self, forKey: "type")
        self.logs = try values.decode(String.self, forKey: "logs")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(type, forKey: "type")
        try values.encode(logs, forKey: "logs")
    }
}
