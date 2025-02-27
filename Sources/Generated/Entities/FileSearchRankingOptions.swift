// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// File search tool call ranking options
///
/// The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score_threshold of 0.
/// 
/// See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
public struct FileSearchRankingOptions: Codable {
    /// The ranker to use for the file search. If not specified will use the `auto` ranker.
    public var ranker: Ranker?
    /// The score threshold for the file search. All values must be a floating point number between 0 and 1.
    public var scoreThreshold: Double

    /// The ranker to use for the file search. If not specified will use the `auto` ranker.
    public enum Ranker: String, Codable, CaseIterable {
        case auto
        case default20240821 = "default_2024_08_21"
    }

    public init(ranker: Ranker? = nil, scoreThreshold: Double) {
        self.ranker = ranker
        self.scoreThreshold = scoreThreshold
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.ranker = try values.decodeIfPresent(Ranker.self, forKey: "ranker")
        self.scoreThreshold = try values.decode(Double.self, forKey: "score_threshold")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(ranker, forKey: "ranker")
        try values.encode(scoreThreshold, forKey: "score_threshold")
    }
}
