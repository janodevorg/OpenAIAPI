// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Realtime {
    public var sessions: Sessions {
        Sessions(path: path + "/sessions")
    }

    public struct Sessions {
        /// Path: `/realtime/sessions`
        public let path: String

        /// Create an ephemeral API token for use in client-side applications with the
        /// Realtime API. Can be configured with the same session parameters as the
        /// `session.update` client event.
        /// 
        /// It responds with a session object, plus a `client_secret` key which contains
        /// a usable ephemeral API token that can be used to authenticate browser clients
        /// for the Realtime API.
        public func post(_ body: OpenAIAPI.RealtimeSessionCreateRequest) -> Request<OpenAIAPI.RealtimeSessionCreateResponse> {
            Request(path: path, method: "POST", body: body, id: "create-realtime-session")
        }
    }
}
