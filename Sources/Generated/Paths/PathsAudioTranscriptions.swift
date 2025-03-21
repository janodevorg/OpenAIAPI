// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Audio {
    public var transcriptions: Transcriptions {
        Transcriptions(path: path + "/transcriptions")
    }

    public struct Transcriptions {
        /// Path: `/audio/transcriptions`
        public let path: String

        /// Transcribes audio into the input language.
        public func post(_ body: Data) -> Request<PostResponse> {
            Request(path: path, method: "POST", body: body, id: "createTranscription")
        }

        public enum PostResponse: Decodable {
            case createTranscriptionResponseJSON(OpenAIAPI.CreateTranscriptionResponseJSON)
            case createTranscriptionResponseVerboseJSON(OpenAIAPI.CreateTranscriptionResponseVerboseJSON)

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                if let value = try? container.decode(OpenAIAPI.CreateTranscriptionResponseJSON.self) {
                    self = .createTranscriptionResponseJSON(value)
                } else if let value = try? container.decode(OpenAIAPI.CreateTranscriptionResponseVerboseJSON.self) {
                    self = .createTranscriptionResponseVerboseJSON(value)
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Data could not be decoded as any of the expected types (OpenAIAPI.CreateTranscriptionResponseJSON, OpenAIAPI.CreateTranscriptionResponseVerboseJSON)."
                    )
                }
            }
        }
    }
}
