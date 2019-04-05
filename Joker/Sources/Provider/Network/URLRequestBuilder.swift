import Foundation
import UIKit

protocol URLRequestBuilding {
	func jokeURLRequest() -> URLRequest
}

class URLRequestBuilder: URLRequestBuilding {

	init(urlBuilder: URLBuilding = URLBuilder()) {
		self.urlBuilder = urlBuilder
	}
	
	func jokeURLRequest() -> URLRequest {
		let url = urlBuilder.jokeURL()
		var builtRequest = URLRequest.init(url: url)
		builtRequest.addValue(UIDevice.current.identifierForVendor?.uuidString ?? "", forHTTPHeaderField: "x-device-uuid")
		return builtRequest
	}

	// MARK: - Private

	private let urlBuilder: URLBuilding
}
