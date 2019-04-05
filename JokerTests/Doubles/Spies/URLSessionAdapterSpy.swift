import Foundation
@testable import Joker

class URLSessionAdapterSpy: URLSessionAdapting {

	class TaskStub: URLSessionDataTaskAdapting {
		var resumed: Bool = false

		func resume() {
			self.resumed = true
		}
	}

	var capturedRequest: URLRequest?
	var capturedCompletion: ((Data?, URLResponse?, Error?) -> Void)?
	var stubbedTask: URLSessionDataTaskAdapting = TaskStub()

	func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskAdapting {
		capturedRequest = request
		capturedCompletion  = completionHandler
		return stubbedTask
	}

	func simmulateSuccessWithData(data: Data) {
		guard let request = capturedRequest, let completion = capturedCompletion, let url = request.url else { return }
		completion(data, HTTPURLResponse(url: url, statusCode: 200, httpVersion: "https", headerFields: nil), nil)
	}

	func simmulateError(error: Error) {
		capturedCompletion?(nil, nil, error)
	}
}
