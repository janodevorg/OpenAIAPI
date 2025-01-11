// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// Code Interpreter tool call
///
/// Details of the Code Interpreter tool call the run step was involved in.
public struct RunStepDetailsToolCallsCodeObject: Codable {
    /// The ID of the tool call.
    public var id: String
    /// The type of tool call. This is always going to be `code_interpreter` for this type of tool call.
    public var type: `Type`
    /// The Code Interpreter tool call definition.
    public var codeInterpreter: CodeInterpreter

    /// The type of tool call. This is always going to be `code_interpreter` for this type of tool call.
    public enum `Type`: String, Codable, CaseIterable {
        case codeInterpreter = "code_interpreter"
    }

    /// The Code Interpreter tool call definition.
    public struct CodeInterpreter: Codable {
        /// The input to the Code Interpreter tool call.
        public var input: String
        /// The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
        public var outputs: [Output]

        public enum Output: Codable {
            case runStepDetailsToolCallsCodeOutputLogsObject(RunStepDetailsToolCallsCodeOutputLogsObject)
            case runStepDetailsToolCallsCodeOutputImageObject(RunStepDetailsToolCallsCodeOutputImageObject)

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                if let value = try? container.decode(RunStepDetailsToolCallsCodeOutputLogsObject.self) {
                    self = .runStepDetailsToolCallsCodeOutputLogsObject(value)
                } else if let value = try? container.decode(RunStepDetailsToolCallsCodeOutputImageObject.self) {
                    self = .runStepDetailsToolCallsCodeOutputImageObject(value)
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Data could not be decoded as any of the expected types (RunStepDetailsToolCallsCodeOutputLogsObject, RunStepDetailsToolCallsCodeOutputImageObject)."
                    )
                }
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.singleValueContainer()
                switch self {
                case .runStepDetailsToolCallsCodeOutputLogsObject(let value): try container.encode(value)
                case .runStepDetailsToolCallsCodeOutputImageObject(let value): try container.encode(value)
                }
            }
        }

        public init(input: String, outputs: [Output]) {
            self.input = input
            self.outputs = outputs
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.input = try values.decode(String.self, forKey: "input")
            self.outputs = try values.decode([Output].self, forKey: "outputs")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(input, forKey: "input")
            try values.encode(outputs, forKey: "outputs")
        }
    }

    public init(id: String, type: `Type`, codeInterpreter: CodeInterpreter) {
        self.id = id
        self.type = type
        self.codeInterpreter = codeInterpreter
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(String.self, forKey: "id")
        self.type = try values.decode(`Type`.self, forKey: "type")
        self.codeInterpreter = try values.decode(CodeInterpreter.self, forKey: "code_interpreter")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encode(type, forKey: "type")
        try values.encode(codeInterpreter, forKey: "code_interpreter")
    }
}
