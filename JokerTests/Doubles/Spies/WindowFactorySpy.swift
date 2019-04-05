import UIKit
@testable import Joker

class WindowFactorySpy: WindowFactory {

    var stubbedWindow = UIWindow(frame: .zero)
    private(set) var capturedKeyWindowWithController: UIViewController?

    // MARK: - WindowFactory

    func createKeyWindow(rootViewController: UIViewController) -> UIWindow {
        capturedKeyWindowWithController = rootViewController
        return stubbedWindow
    }
}
