import XCTest
@testable import Pagie

final class PagieTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Pagie().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
