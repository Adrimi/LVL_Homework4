@testable import Joker
import XCTest

class URLBuilderSpy: URLBuilding {

	var jokeURLCalled: Bool = false
	var stubbedURL: URL

	init(stubbedURL: URL) {
		self.stubbedURL = stubbedURL
	}

	// MARK: - URLBuilding

	func jokeURL() -> URL {
		jokeURLCalled = true
		return stubbedURL
	}
}
