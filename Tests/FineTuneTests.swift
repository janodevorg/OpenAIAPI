import OpenAIAPI
import XCTest

final class FineTuneTests: XCTestCase {
    func testFineTune() throws {
        guard let url = Bundle.module.url(forResource: "FineTune", withExtension: "json") else {
            XCTFail("Missing file FineTuneTests.json")
            return
        }
        guard let data = String(data: try Data(contentsOf: url), encoding: .utf8)?.data(using: .utf8) else {
            XCTFail("Couldn’t read file with url \(url)")
            return
        }
        let finetune = try XCTUnwrap(try JSONDecoder().decode(FineTune.self, from: data))
        XCTAssertEqual(finetune.hyperparams.values["prompt_loss_weight"] as? Double, 0.01)
        XCTAssertEqual(finetune.hyperparams.values["n_epochs"] as? Int, 4)
    }
}
