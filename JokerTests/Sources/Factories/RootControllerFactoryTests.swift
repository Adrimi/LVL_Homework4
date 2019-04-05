import XCTest
@testable import Joker

class RootControllerFactoryTests: XCTestCase {

	var sut: RootControllerFactoryImpl!

	override func setUp() {
		super.setUp()
		sut = RootControllerFactoryImpl()
	}

	override func tearDown() {
		sut = nil
		super.tearDown()
	}

	func testShouldMakeRootViewController() {
		XCTAssertNoThrow(sut.createRootController())
	}

	func testShouldCreateCorrectViewController() {
		XCTAssertTrue(sut.createRootController() is JokeViewController)
	}
}
