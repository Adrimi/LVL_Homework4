import XCTest
import UIKit
@testable import Joker

class JokeViewControllerTests_View: XCTestCase {

	var sut: JokeViewController!
	var jokeProviderFake: JokeProviderSpy!

	override func setUp() {
		super.setUp()
		jokeProviderFake = JokeProviderSpy()
		sut = JokeViewController(jokeProvider: jokeProviderFake)
		_ = sut.view
	}

	override func tearDown() {
		sut = nil
		jokeProviderFake = nil
		super.tearDown()
	}

	func testButtonHasCorrectText() {
		XCTAssertEqual(sut.refreshButton.title(for: .normal), "Fetch Joke!")
	}

	func testLabelHasCorrectText() {
		XCTAssertEqual(sut.jokeLabel.text ?? "", "")
	}

	func testLabelShouldHaveCorrectNumberOfLines() {
		XCTAssertEqual(sut.jokeLabel.numberOfLines, 0)
	}

	func testLabelShouldHaveCorrectAlignment() {
		XCTAssertEqual(sut.jokeLabel.textAlignment, NSTextAlignment.center)
	}
}
