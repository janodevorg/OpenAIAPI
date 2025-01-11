// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Organization {
    public var invites: Invites {
        Invites(path: path + "/invites")
    }

    public struct Invites {
        /// Path: `/organization/invites`
        public let path: String

        /// Returns a list of invites in the organization.
        public func get(limit: Int? = nil, after: String? = nil) -> Request<OpenAIAPI.InviteListResponse> {
            Request(path: path, method: "GET", query: makeGetQuery(limit, after), id: "list-invites")
        }

        private func makeGetQuery(_ limit: Int?, _ after: String?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(limit, forKey: "limit")
            encoder.encode(after, forKey: "after")
            return encoder.items
        }

        /// Create an invite for a user to the organization. The invite must be accepted by the user before they have access to the organization.
        public func post(_ body: OpenAIAPI.InviteRequest) -> Request<OpenAIAPI.Invite> {
            Request(path: path, method: "POST", body: body, id: "inviteUser")
        }
    }
}
