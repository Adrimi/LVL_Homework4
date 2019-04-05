import Foundation
@testable import Joker

class URLRequestBuilderStub: URLRequestBuilding {

	let stubbedRequest: URLRequest

	init(request: URLRequest) {
		self.stubbedRequest = request
	}

	func jokeURLRequest() -> URLRequest {
		return stubbedRequest
	}
}
