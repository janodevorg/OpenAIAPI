// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    public static var files: Files {
        Files(path: "/files")
    }

    public struct Files {
        /// Path: `/files`
        public let path: String

        /// Returns a list of files that belong to the user's organization.
        public var get: Request<OpenAIAPI.ListFilesResponse> {
            Request(method: "GET", url: path, id: "listFiles")
        }

        /// Upload a file that contains document(s) to be used across various endpoints/features. Currently, the size of all the files uploaded by one organization can be up to 1 GB. Please contact us if you need to increase the storage limit.
        public func post(_ body: Data) -> Request<OpenAIAPI.OpenAIFile> {
            Request(method: "POST", url: path, body: body, id: "createFile")
        }
    }
}