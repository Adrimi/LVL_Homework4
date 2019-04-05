import XCTest
@testable import Joker

class URLRequestBuilderTests: XCTestCase {

	var sut: URLRequestBuilder!
	var urlBuilderSpy: URLBuilderSpy!

	override func setUp() {
		super.setUp()
		urlBuilderSpy = URLBuilderSpy(stubbedURL: URL.init(string: "https://daftmobile.com")!)
		sut = URLRequestBuilder(urlBuilder: urlBuilderSpy)
	}

	override func tearDown() {
		sut = nil
		urlBuilderSpy = nil
		super.tearDown()
	}

	func testBuilderDoesntAskForURLByDefault() {
		XCTAssertFalse(urlBuilderSpy.jokeURLCalled)
	}

	func testBuilderAsksForURLWhenAskedToBuildRequest() {
		_ = sut.jokeURLRequest()
		XCTAssertTrue(urlBuilderSpy.jokeURLCalled)
	}

	func testBuilderReturnsRequestWithValidURL() {
		XCTAssertEqual(sut.jokeURLRequest().url, urlBuilderSpy.stubbedURL)
	}

	// ZADANIE 1: Dodaj testy związane z dodawaniem headerów
}
