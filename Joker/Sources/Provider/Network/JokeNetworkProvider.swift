import Foundation

class JokeNetworkProvider: JokeProviding {

	enum NetworkingError: Error {
		case unknown
		case invalidStatus(status: Int)
	}

	init(parser: JokeParser = JokeParserImpl(), urlRequestBuilder: URLRequestBuilding = URLRequestBuilder(), sessionAdapter: URLSessionAdapting = URLSession.init(configuration: .ephemeral)) {
		self.parser = parser
		self.urlRequestBuilder = urlRequestBuilder
		self.sessionAdapter = sessionAdapter
	}

	// MARK: - Interface

	func fetch(completion: @escaping JokeFetchCompletion) {
		let request = urlRequestBuilder.jokeURLRequest()
		let task = sessionAdapter.dataTask(with: request) { [parser] (data, response, error) in
			DispatchQueue.main.async {
				guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
					completion(.failure(error ?? NetworkingError.unknown))
					return
				}
				guard statusCode == 200 else {
					completion(.failure(NetworkingError.invalidStatus(status: statusCode)))
					return
				}
				guard let data = data else {
					completion(.failure(error ?? NetworkingError.unknown))
					return
				}
				let joke = parser.parse(data: data)
				completion(.success(joke))
			}
		}
		task.resume()
	}

	// MARK: - Private

	private let parser: JokeParser
	private let sessionAdapter: URLSessionAdapting
	private let urlRequestBuilder: URLRequestBuilding

}
