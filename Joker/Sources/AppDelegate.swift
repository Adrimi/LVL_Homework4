import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	var windowFactory: WindowFactory = WindowFactoryImpl(screenBounds: UIScreen.main.bounds)
	var rootControllerFactory: RootControllerFactory = RootControllerFactoryImpl()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		window = windowFactory.createKeyWindow(rootViewController: rootControllerFactory.createRootController())
		return true
	}
}
