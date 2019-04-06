//
//  File.swift
//  JokerTests
//
//  Created by Adrimi on 06/04/2019.
//  Copyright © 2019 DaftAcademy. All rights reserved.
//

import Foundation
import UIKit
@testable import Joker

class UIApplicationSpy: UIApplicationAdapting {
    func getUIAppShared() -> UIApplication {
        return UIApplicationAdapting.getUIAppShared(self)()
    }
}
