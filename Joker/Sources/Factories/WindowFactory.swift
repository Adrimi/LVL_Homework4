import UIKit

protocol WindowFactory {
    func createKeyWindow(rootViewController: UIViewController) -> UIWindow
}
