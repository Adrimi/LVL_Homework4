import XCTest
@testable import Joker

class URLBuilderTests: XCTestCase {

	var sut: URLBuilder!

	override func setUp() {
		super.setUp()
		sut = URLBuilder()
	}

	override func tearDown() {
		sut = nil
		super.tearDown()
	}

	func testBuilderShouldBuildCorrectJokeURL() {
		XCTAssertEqual(sut.jokeURL(), URL(string: "https://switter.app.daftmobile.com/api/joke"))
	}
}
