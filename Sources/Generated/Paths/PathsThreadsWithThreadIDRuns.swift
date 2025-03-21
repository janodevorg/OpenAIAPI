// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Threads.WithThreadID {
    public var runs: Runs {
        Runs(path: path + "/runs")
    }

    public struct Runs {
        /// Path: `/threads/{thread_id}/runs`
        public let path: String

        /// Returns a list of runs belonging to a thread.
        public func get(parameters: GetParameters? = nil) -> Request<OpenAIAPI.ListRunsResponse> {
            Request(path: path, method: "GET", query: parameters?.asQuery, id: "listRuns")
        }

        public struct GetParameters {
            public var limit: Int?
            public var order: Order?
            public var after: String?
            public var before: String?

            public enum Order: String, Codable, CaseIterable {
                case asc
                case desc
            }

            public init(limit: Int? = nil, order: Order? = nil, after: String? = nil, before: String? = nil) {
                self.limit = limit
                self.order = order
                self.after = after
                self.before = before
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(limit, forKey: "limit")
                encoder.encode(order, forKey: "order")
                encoder.encode(after, forKey: "after")
                encoder.encode(before, forKey: "before")
                return encoder.items
            }
        }

        /// Create a run.
        public func post(include: [Include]? = nil, _ body: OpenAIAPI.CreateRunRequest) -> Request<OpenAIAPI.RunObject> {
            Request(path: path, method: "POST", query: makePostQuery(include), body: body, id: "createRun")
        }

        private func makePostQuery(_ include: [Include]?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(include, forKey: "include[]")
            return encoder.items
        }

        public enum Include: String, Codable, CaseIterable {
            case stepDetailsToolCallsFileSearchResultsContent = "step_details.tool_calls[*].file_search.results[*].content"
        }
    }
}
