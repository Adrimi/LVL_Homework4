import UIKit
import XCTest
@testable import Joker

class AppDelegateTests: XCTestCase {

	var sut: AppDelegate!
	var rootControllerFactoryStub: RootControllerFactoryStub!
	var windowFactorySpy: WindowFactorySpy!
	var launchResult: Bool!

	override func setUp() {
		super.setUp()
		windowFactorySpy = WindowFactorySpy()
		rootControllerFactoryStub = RootControllerFactoryStub()
		sut = AppDelegate()
		sut.windowFactory = windowFactorySpy
		sut.rootControllerFactory = rootControllerFactoryStub
		launchResult = sut.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
	}

	override func tearDown() {
		sut = nil
		windowFactorySpy = nil
		rootControllerFactoryStub = nil
		super.tearDown()
	}

	func testApplicationShouldLaunchWithTrueValue() {
		XCTAssertEqual(launchResult, true)
	}

	func testShouldSetWindowFromFactory() {
		XCTAssertTrue(sut.window === windowFactorySpy.stubbedWindow)
	}

	func testShouldPassCorrectViewControllerAsRoot() {
		XCTAssertTrue(windowFactorySpy.capturedKeyWindowWithController === rootControllerFactoryStub.stubbedRootController)
	}
}
