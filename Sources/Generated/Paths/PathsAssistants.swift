// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths {
    public static var assistants: Assistants {
        Assistants(path: "/assistants")
    }

    public struct Assistants {
        /// Path: `/assistants`
        public let path: String

        /// Returns a list of assistants.
        public func get(parameters: GetParameters? = nil) -> Request<OpenAIAPI.ListAssistantsResponse> {
            Request(path: path, method: "GET", query: parameters?.asQuery, id: "listAssistants")
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

        /// Create an assistant with a model and instructions.
        public func post(_ body: OpenAIAPI.CreateAssistantRequest) -> Request<OpenAIAPI.AssistantObject> {
            Request(path: path, method: "POST", body: body, id: "createAssistant")
        }
    }
}
