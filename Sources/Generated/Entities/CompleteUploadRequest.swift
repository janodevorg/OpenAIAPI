// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct CompleteUploadRequest: Codable {
    /// The ordered list of Part IDs.
    public var partIDs: [String]
    /// The optional md5 checksum for the file contents to verify if the bytes uploaded matches what you expect.
    public var md5: String?

    public init(partIDs: [String], md5: String? = nil) {
        self.partIDs = partIDs
        self.md5 = md5
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.partIDs = try values.decode([String].self, forKey: "part_ids")
        self.md5 = try values.decodeIfPresent(String.self, forKey: "md5")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(partIDs, forKey: "part_ids")
        try values.encodeIfPresent(md5, forKey: "md5")
    }
}
