// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Chat {
    public var completions: Completions {
        Completions(path: path + "/completions")
    }

    public struct Completions {
        /// Path: `/chat/completions`
        public let path: String

        /// Creates a model response for the given chat conversation. Learn more in the
        /// [text generation](/docs/guides/text-generation), [vision](/docs/guides/vision),
        /// and [audio](/docs/guides/audio) guides.
        /// 
        /// Parameter support can differ depending on the model used to generate the
        /// response, particularly for newer reasoning models. Parameters that are only
        /// supported for reasoning models are noted below. For the current state of 
        /// unsupported parameters in reasoning models, 
        /// [refer to the reasoning guide](/docs/guides/reasoning).
        public func post(_ body: OpenAIAPI.CreateChatCompletionRequest) -> Request<OpenAIAPI.CreateChatCompletionResponse> {
            Request(path: path, method: "POST", body: body, id: "createChatCompletion")
        }
    }
}
