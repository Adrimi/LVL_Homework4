import XCTest
@testable import Joker

class JokeNetworkProviderTests: XCTestCase {

	var sut: JokeNetworkProvider!
	var sessionSpy: URLSessionAdapterSpy!
	var urlRequestStub: URLRequestBuilderStub!
	var jokeParser: AlwaysJokeParser!

	override func setUp() {
		super.setUp()
		jokeParser = AlwaysJokeParser()
		sessionSpy = URLSessionAdapterSpy()
		urlRequestStub = URLRequestBuilderStub(request: URLRequest(url: URL(string: "http://onet.pl")!))
		sut = JokeNetworkProvider(parser: jokeParser, urlRequestBuilder: urlRequestStub, sessionAdapter: sessionSpy)
	}

	override func tearDown() {
		sessionSpy = nil
		jokeParser = nil
		urlRequestStub = nil
		sut = nil
		super.tearDown()
	}

	func testShouldCallDataTask() {
		sut.fetch { _ in }
		XCTAssertNotNil(sessionSpy.capturedRequest)
	}

	func testShouldPassCorrectRequest() {
		sut.fetch { _ in }
		XCTAssertEqual(sessionSpy.capturedRequest, urlRequestStub.jokeURLRequest())
	}

	func testShouldNotCallCompletion() {
		let expec = expectation(description: "closure should not complete")
		expec.isInverted = true
		sut.fetch { _ in expec.fulfill() }
		wait(for: [expec], timeout: 0.1)
	}

	func testShouldCallCompletionAfterTaskIsDone() {
		let expec = expectation(description: "Task")
		sut.fetch { _ in expec.fulfill() }
		sessionSpy.simmulateSuccessWithData(data: Data())
		wait(for: [expec], timeout: 0.1)
	}

	func testShouldCallCompletionWithAJoke() {
		let expec = expectation(description: "Task")
		sut.fetch { result in
			if let joke = try? result.get(), joke.content == "Joke" { expec.fulfill() }
		}
		sessionSpy.simmulateSuccessWithData(data: Data())
		wait(for: [expec], timeout: 0.1)
	}

	func testShouldCallCompletionWithAnError() {
		let expec = expectation(description: "Task")
		sut.fetch { result in
			do {
				try _ = result.get()
			} catch {
				expec.fulfill()
			}
		}
		sessionSpy.simmulateError(error: NSError(domain: "", code: -1, userInfo: nil))
		wait(for: [expec], timeout: 0.1)
	}
}
