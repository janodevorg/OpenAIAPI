import Foundation

private struct CK: CodingKey {
    var stringValue: String
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    var intValue: Int?
    init?(intValue: Int) {
        nil
    }
}

public struct UnknownDictionary: Codable {
    public var values: [String: Any]

    public init(values: [String: Any]) {
        self.values = values
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CK.self)
        var values = [String: Any]()
        for key in container.allKeys {
            if let value = try? container.decode(Int.self, forKey: key) {
                values[key.stringValue] = value
            } else if let value = try? container.decode(Double.self, forKey: key) {
                values[key.stringValue] = value
            } else if let value = try? container.decode(String.self, forKey: key) {
                values[key.stringValue] = value
            } else if let value = try? container.decode(Bool.self, forKey: key) {
                values[key.stringValue] = value
            } else if let value = try? container.decodeIfPresent(Int.self, forKey: key) {
                values[key.stringValue] = value
            } else if let value = try? container.decodeIfPresent(Double.self, forKey: key) {
                values[key.stringValue] = value
            } else if let value = try? container.decodeIfPresent(String.self, forKey: key) {
                values[key.stringValue] = value
            } else if let value = try? container.decodeIfPresent(Bool.self, forKey: key) {
                values[key.stringValue] = value
            }
            // setting nil on a dictionary removes an element (instead creating a "key":nil) so we ignore the nil case
            // else { values[key.stringValue] = nil }
        }
        self.values = values
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CK.self)
        for (key, value) in values {
            guard let ck = CK(stringValue: key) else { continue }
            if let value = value as? Int {
                try container.encode(value, forKey: ck)
            } else if let value = value as? Double {
                // *100/100 turns rounding errors like 3.1400000000000001 into 3.14
                try container.encode((value * 100) / 100, forKey: ck)
            } else if let value = value as? String {
                try container.encode(value, forKey: ck)
            } else if let value = value as? Bool {
                try container.encode(value, forKey: ck)
            }
            // value won’t be nil since we are reading it from a dictionary so we ignore the nil case
            // else if value == nil { try container.encodeNil(forKey: ck) }
        }
    }
}
