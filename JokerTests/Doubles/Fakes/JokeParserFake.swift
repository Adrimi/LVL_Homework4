import Foundation
@testable import Joker

class AlwaysJokeParser: JokeParser {
	func parse(data: Data) -> Joke {
		return Joke(content: "Joke")
	}
}
