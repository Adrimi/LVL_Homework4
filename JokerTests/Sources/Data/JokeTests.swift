import XCTest
@testable import Joker

class JokeTests: XCTestCase {

	func testJokeShouldDeserializeCorrectly() {
		let json = Bundle.jsonData(forName: "joke")
		XCTAssertNoThrow(try JSONDecoder().decode(Joke.self, from: json))
	}

	func testJokeShouldDeserializeWithContent() {
		let json = Bundle.jsonData(forName: "joke")
		let joke = try? JSONDecoder().decode(Joke.self, from: json)
		XCTAssertEqual(joke?.content, "Something funny.")
	}
}
