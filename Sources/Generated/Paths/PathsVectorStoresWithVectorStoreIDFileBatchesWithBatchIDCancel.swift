// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.VectorStores.WithVectorStoreID.FileBatches.WithBatchID {
    public var cancel: Cancel {
        Cancel(path: path + "/cancel")
    }

    public struct Cancel {
        /// Path: `/vector_stores/{vector_store_id}/file_batches/{batch_id}/cancel`
        public let path: String

        /// Cancel a vector store file batch. This attempts to cancel the processing of files in this batch as soon as possible.
        public var post: Request<OpenAIAPI.VectorStoreFileBatchObject> {
            Request(path: path, method: "POST", id: "cancelVectorStoreFileBatch")
        }
    }
}
