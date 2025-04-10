// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// FileSearch tool
public struct AssistantToolsFileSearch: Codable {
    /// The type of tool being defined: `file_search`
    public var type: `Type`
    /// Overrides for the file search tool.
    public var fileSearch: FileSearch?

    /// The type of tool being defined: `file_search`
    public enum `Type`: String, Codable, CaseIterable {
        case fileSearch = "file_search"
    }

    /// Overrides for the file search tool.
    public struct FileSearch: Codable {
        /// The maximum number of results the file search tool should output. The default is 20 for `gpt-4*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
        /// 
        /// Note that the file search tool may output fewer than `max_num_results` results. See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
        public var maxNumResults: Int?
        /// File search tool call ranking options
        ///
        /// The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score_threshold of 0.
        /// 
        /// See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
        public var rankingOptions: FileSearchRankingOptions?

        public init(maxNumResults: Int? = nil, rankingOptions: FileSearchRankingOptions? = nil) {
            self.maxNumResults = maxNumResults
            self.rankingOptions = rankingOptions
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.maxNumResults = try values.decodeIfPresent(Int.self, forKey: "max_num_results")
            self.rankingOptions = try values.decodeIfPresent(FileSearchRankingOptions.self, forKey: "ranking_options")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(maxNumResults, forKey: "max_num_results")
            try values.encodeIfPresent(rankingOptions, forKey: "ranking_options")
        }
    }

    public init(type: `Type`, fileSearch: FileSearch? = nil) {
        self.type = type
        self.fileSearch = fileSearch
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.type = try values.decode(`Type`.self, forKey: "type")
        self.fileSearch = try values.decodeIfPresent(FileSearch.self, forKey: "file_search")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(type, forKey: "type")
        try values.encodeIfPresent(fileSearch, forKey: "file_search")
    }
}
