import Foundation

class JokeFileProvider: JokeProviding {
	init(parser: JokeParser = JokeParserImpl()) {
		self.parser = parser
	}

	// MARK: - Interface

	func fetch(completion: @escaping JokeFetchCompletion) {
		let data = exampleFileData()
		let joke = parser.parse(data: data)

		completion(.success(joke))
	}

	// MARK: - Private

	private let parser: JokeParser

	// MARK: Mock data

	private func exampleFileData() -> Data {
		guard let exampleFilePath = Bundle.main.url(forResource: "sample_joke", withExtension: "json") else { fatalError() }
		guard let data = try? Data(contentsOf: exampleFilePath) else { fatalError() }

		return data
	}
}
