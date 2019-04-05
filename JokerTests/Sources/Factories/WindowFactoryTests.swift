import XCTest
@testable import Joker

class WindowFactoryTests: XCTestCase {

	var sut: WindowFactoryImpl!

	override func setUp() {
		super.setUp()
		sut = WindowFactoryImpl(screenBounds: CGRect(x: 10.0, y: 10.0, width: 100.0, height: 100.0))
	}

	override func tearDown() {
		sut = nil
		super.tearDown()
	}

	func testShouldCreateWindow() {
		XCTAssertNotNil(sut.createKeyWindow(rootViewController: UIViewController()))
	}

	func testShouldHaveCorrectFrame() {
		XCTAssertEqual(sut.createKeyWindow(rootViewController: UIViewController()).frame, CGRect(x: 10, y: 10, width: 100, height: 100))
	}

	func testShouldMakeTheCorrectViewControllerTheRoot() {
		let root = UIViewController()
		XCTAssertTrue(sut.createKeyWindow(rootViewController: root).rootViewController === root)
	}

	func testShouldBeKeyWindow() {
		XCTAssertTrue(sut.createKeyWindow(rootViewController: UIViewController()).isKeyWindow)
	}
}
