@testable import Joker
import XCTest

class JokeProviderSpy: JokeProviding {

    private(set) var capturedCompletion: JokeFetchCompletion?
	private(set) var fetchJokeCallCount = 0

    // MARK: - JokeProvider

	func fetch(completion: @escaping JokeFetchCompletion) {
		fetchJokeCallCount += 1
		self.capturedCompletion = completion
	}

	// MARK: Stubs

	func simmulateCompletion(joke: Joke) {
		capturedCompletion?(.success(joke))
	}

	func simmulateCompletion(error: Error) {
		capturedCompletion?(.failure(error))
	}
}
