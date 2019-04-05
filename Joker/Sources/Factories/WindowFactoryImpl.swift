import UIKit

class WindowFactoryImpl: WindowFactory {

    init(screenBounds: CGRect) {
        self.screenBounds = screenBounds
    }

    // MARK: - WindowFactory

    func createKeyWindow(rootViewController: UIViewController) -> UIWindow {
        let window = UIWindow(frame: screenBounds)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()

        return window
    }

    // MARK: - Privates

    private let screenBounds: CGRect

}
