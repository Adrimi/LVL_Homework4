import UIKit

let appDelegateClass: AnyClass = NSClassFromString("JokerTests.AppDelegateStub") ?? AppDelegate.self

UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(appDelegateClass))
