typealias JokeFetchCompletion = (Result<Joke, Error>) -> ()

protocol JokeProviding {
	func fetch(completion: @escaping JokeFetchCompletion)
}
