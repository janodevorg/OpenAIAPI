// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Organization {
    public var users: Users {
        Users(path: path + "/users")
    }

    public struct Users {
        /// Path: `/organization/users`
        public let path: String

        /// Lists all of the users in the organization.
        public func get(limit: Int? = nil, after: String? = nil) -> Request<OpenAIAPI.UserListResponse> {
            Request(path: path, method: "GET", query: makeGetQuery(limit, after), id: "list-users")
        }

        private func makeGetQuery(_ limit: Int?, _ after: String?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(limit, forKey: "limit")
            encoder.encode(after, forKey: "after")
            return encoder.items
        }
    }
}
