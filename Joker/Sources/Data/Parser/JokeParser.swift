import Foundation

protocol JokeParser {
	func parse(data: Data) -> Joke
}
