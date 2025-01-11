// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.VectorStores.WithVectorStoreID {
    public var files: Files {
        Files(path: path + "/files")
    }

    public struct Files {
        /// Path: `/vector_stores/{vector_store_id}/files`
        public let path: String

        /// Returns a list of vector store files.
        public func get(parameters: GetParameters? = nil) -> Request<OpenAIAPI.ListVectorStoreFilesResponse> {
            Request(path: path, method: "GET", query: parameters?.asQuery, id: "listVectorStoreFiles")
        }

        public struct GetParameters {
            public var limit: Int?
            public var order: Order?
            public var after: String?
            public var before: String?
            public var filter: Filter?

            public enum Order: String, Codable, CaseIterable {
                case asc
                case desc
            }

            public enum Filter: String, Codable, CaseIterable {
                case inProgress = "in_progress"
                case completed
                case failed
                case cancelled
            }

            public init(limit: Int? = nil, order: Order? = nil, after: String? = nil, before: String? = nil, filter: Filter? = nil) {
                self.limit = limit
                self.order = order
                self.after = after
                self.before = before
                self.filter = filter
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(limit, forKey: "limit")
                encoder.encode(order, forKey: "order")
                encoder.encode(after, forKey: "after")
                encoder.encode(before, forKey: "before")
                encoder.encode(filter, forKey: "filter")
                return encoder.items
            }
        }

        /// Create a vector store file by attaching a [File](/docs/api-reference/files) to a [vector store](/docs/api-reference/vector-stores/object).
        public func post(_ body: OpenAIAPI.CreateVectorStoreFileRequest) -> Request<OpenAIAPI.VectorStoreFileObject> {
            Request(path: path, method: "POST", body: body, id: "createVectorStoreFile")
        }
    }
}
