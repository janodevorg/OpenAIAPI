// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Images {
    public var generations: Generations {
        Generations(path: path + "/generations")
    }

    public struct Generations {
        /// Path: `/images/generations`
        public let path: String

        /// Creates an image given a prompt.
        public func post(_ body: OpenAIAPI.CreateImageRequest) -> Request<OpenAIAPI.ImagesResponse> {
            Request(path: path, method: "POST", body: body, id: "createImage")
        }
    }
}
