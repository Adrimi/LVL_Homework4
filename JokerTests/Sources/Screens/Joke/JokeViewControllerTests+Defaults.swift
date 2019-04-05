import XCTest
import UIKit
@testable import Joker

class JokeViewControllerTests_Defaults: XCTestCase {

	var sut: JokeViewController!

	override func setUp() {
		super.setUp()
		sut = JokeViewController()
	}

	override func tearDown() {
		sut = nil
		super.tearDown()
	}

	func testDefaultJokeProviderShouldBeNetwork() {
		XCTAssertTrue(sut.jokeProvider is JokeNetworkProvider)
	}
}
