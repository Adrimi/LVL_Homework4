import UIKit

class RootControllerFactoryImpl: RootControllerFactory {

    // MARK: - RootControllerFactory

	func createRootController() -> UIViewController {
        return JokeViewController()
    }
}
