import XCTest
import UIKit
@testable import Joker

struct DummyError: Error {
	var localizedDescription: String { return "Some Error" }
}

class JokeViewControllerTests_Refresh: XCTestCase {

	var sut: JokeViewController!
	var jokeProviderFake: JokeProviderSpy!
    var uiApplicationSpy: UIApplicationSpy!

	override func setUp() {
		super.setUp()
		jokeProviderFake = JokeProviderSpy()
        uiApplicationSpy = UIApplicationSpy()
		sut = JokeViewController(jokeProvider: jokeProviderFake)
		_ = sut.view
	}

	override func tearDown() {
		sut = nil
		jokeProviderFake = nil
        uiApplicationSpy = nil
		super.tearDown()
	}

	private func simulateRefresh() {
		sut.refreshButton.simulateTap()
	}

	private func simulateRefreshWithSuccess(joke: String = "Funny joke") {
		sut.refreshButton.simulateTap()
		jokeProviderFake.simmulateCompletion(joke: Joke(content: joke))
	}

	private func simulateRefreshWithError() {
		sut.refreshButton.simulateTap()
		jokeProviderFake.simmulateCompletion(error: DummyError())
	}

	func testShouldNotCallReloadByDefault() {
		XCTAssertEqual(jokeProviderFake.fetchJokeCallCount, 0)
	}

	func testShouldStartReloadAfterTap() {
		simulateRefresh()
		XCTAssertEqual(jokeProviderFake.fetchJokeCallCount, 1)
	}

	func testButtonIsEnabledByDefault() {
		XCTAssertEqual(sut.refreshButton.isUserInteractionEnabled, true)
	}

	func testButtonIsDisabledAfterFetch() {
		simulateRefresh()
		XCTAssertEqual(sut.refreshButton.isUserInteractionEnabled, false)
	}

	func testLabelIsChangedAfterSuccessfulRefresh() {
		simulateRefreshWithSuccess(joke: "Something")
		XCTAssertEqual(sut.jokeLabel.text, "Something")
	}

	func testButtonIsEnabledAfterSuccessfulRefresh() {
		simulateRefreshWithSuccess()
		XCTAssertEqual(sut.refreshButton.isUserInteractionEnabled, true)
	}

	func testLabelIsRefreshedAfterFetchError() {
		simulateRefreshWithError()
		XCTAssertEqual(sut.jokeLabel.text, "Error")
	}

	func testButtonIsEnabledAfterRefreshWithError() {
		simulateRefreshWithError()
		XCTAssertEqual(sut.refreshButton.isUserInteractionEnabled, true)
	}

	// TODO: TASK 2
	// Add tests to show activity indicator in view
    
    func testNetworkActivityIndicatorShouldAppearOnFetch() {
        simulateRefresh()
        XCTAssertTrue(uiApplicationSpy.getUIAppShared().isNetworkActivityIndicatorVisible)
    }
    
    func testNetworkActivityIndicatorDissapearAfterError() {
        simulateRefreshWithError()
        XCTAssertFalse(uiApplicationSpy.getUIAppShared().isNetworkActivityIndicatorVisible)
    }
    
    func testNetworkActivityIndicatorDissapearAfterSuccess() {
        simulateRefreshWithSuccess()
        XCTAssertFalse(uiApplicationSpy.getUIAppShared().isNetworkActivityIndicatorVisible)
    }
    
}

