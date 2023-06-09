// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    public static var embeddings: Embeddings {
        Embeddings(path: "/embeddings")
    }

    public struct Embeddings {
        /// Path: `/embeddings`
        public let path: String

        /// Creates an embedding vector representing the input text.
        public func post(_ body: OpenAIAPI.CreateEmbeddingRequest) -> Request<OpenAIAPI.CreateEmbeddingResponse> {
            Request(method: "POST", url: path, body: body, id: "createEmbedding")
        }
    }
}
