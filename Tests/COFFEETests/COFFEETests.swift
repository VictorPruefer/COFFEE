import XCTest
@testable import COFFEE

final class COFFEETests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(COFFEE().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
