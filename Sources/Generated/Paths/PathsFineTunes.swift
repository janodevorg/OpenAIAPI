// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    public static var fineTunes: FineTunes {
        FineTunes(path: "/fine-tunes")
    }

    public struct FineTunes {
        /// Path: `/fine-tunes`
        public let path: String

        /// List your organization's fine-tuning jobs
        public var get: Request<OpenAIAPI.ListFineTunesResponse> {
            Request(method: "GET", url: path, id: "listFineTunes")
        }

        /// Creates a job that fine-tunes a specified model from a given dataset.
        /// 
        /// Response includes details of the enqueued job including job status and the name of the fine-tuned models once complete.
        /// 
        /// [Learn more about Fine-tuning](/docs/guides/fine-tuning)
        public func post(_ body: OpenAIAPI.CreateFineTuneRequest) -> Request<OpenAIAPI.FineTune> {
            Request(method: "POST", url: path, body: body, id: "createFineTune")
        }
    }
}
