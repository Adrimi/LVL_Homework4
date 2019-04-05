import UIKit
@testable import Joker

class RootControllerFactoryStub: RootControllerFactory {

	var stubbedRootController = UIViewController(nibName: nil, bundle: nil)

	// MARK: - RootControllerFactoryProtocol

	func createRootController() -> UIViewController {
		return stubbedRootController
	}
}
