import Foundation

class JokeParserImpl: JokeParser {

	init(jsonDecoder: JSONDecoder = .default) {
		self.jsonDecoder = jsonDecoder
	}

	// MARK: - JokeParsing

	func parse(data: Data) -> Joke {
		guard let joke = try? jsonDecoder.decode(Joke.self, from: data) else { fatalError() }
		return joke
	}

	// MARK: - Private

	private let jsonDecoder: JSONDecoder

}
