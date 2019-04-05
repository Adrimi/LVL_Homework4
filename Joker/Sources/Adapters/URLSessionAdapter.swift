import Foundation

protocol URLSessionAdapting {
	func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskAdapting
}

extension URLSession: URLSessionAdapting {

	func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskAdapting {
		let task: URLSessionDataTask = self.dataTask(with: request, completionHandler: completionHandler)
		return task
	}
}

protocol URLSessionDataTaskAdapting {
	func resume()
}

extension URLSessionDataTask: URLSessionDataTaskAdapting { }
