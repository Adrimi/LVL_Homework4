import Foundation

protocol URLBuilding {
	func jokeURL() -> URL
}

class URLBuilder: URLBuilding {

	private let domain = "switter.app.daftmobile.com"
	private let `protocol` = "https"
	private let jokePath = "/api/joke"

	func jokeURL() -> URL {
		return URL.init(string: self.protocol + "://" + domain + jokePath)!
	}
}
