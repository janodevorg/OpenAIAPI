@testable import OpenAIAPI
import XCTest

final class UnknownDictionaryTests: XCTestCase {
    let json = """
    {
        "foo": 123,
        "bar": null,
        "baz": "hello",
        "qux": true,
        "quux": 3.14
    }
    """

    func testDecode() throws {
        let jsonData = try XCTUnwrap(json.data(using: .utf8))
        let dic = try JSONDecoder().decode(UnknownDictionary.self, from: jsonData)
        XCTAssertEqual(dic.values["foo"] as? Int, 123)
        XCTAssertEqual(dic.values["baz"] as? String, "hello")
        XCTAssertEqual(dic.values["qux"] as? Bool, true)
        XCTAssertEqual(dic.values["quux"] as? Double, 3.14)
    }

    func testEncode() throws {
        let dic = UnknownDictionary(values: [
            "foo": 123,
            "baz": "hello",
            "qux": true,
            "quux": 3.14
        ])
        let json = String(data: try JSONEncoder().encode(dic), encoding: .utf8)
        let expected = """
        {"foo":123,"baz\":"hello","qux":true,"quux":3.1400000000000001}
        """
        XCTAssertEqual(json, expected)
    }
}
