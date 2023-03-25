// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

extension Paths.Images {
    public var edits: Edits {
        Edits(path: path + "/edits")
    }

    public struct Edits {
        /// Path: `/images/edits`
        public let path: String

        /// Creates an edited or extended image given an original image and a prompt.
        public func post(_ body: Data) -> Request<OpenAIAPI.ImagesResponse> {
            Request(method: "POST", url: path, body: body, id: "createImageEdit")
        }
    }
}