// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

extension Paths.Models {
    public func model(_ model: String) -> WithModel {
        WithModel(path: "\(path)/\(model)")
    }

    public struct WithModel {
        /// Path: `/models/{model}`
        public let path: String

        /// Retrieves a model instance, providing basic information about the model such as the owner and permissioning.
        public var get: Request<OpenAIAPI.Model> {
            Request(method: "GET", url: path, id: "retrieveModel")
        }

        /// Delete a fine-tuned model. You must have the Owner role in your organization.
        public var delete: Request<OpenAIAPI.DeleteModelResponse> {
            Request(method: "DELETE", url: path, id: "deleteModel")
        }
    }
}
