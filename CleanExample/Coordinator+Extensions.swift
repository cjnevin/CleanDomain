//
//  Coordinator+Extensions.swift
//  CleanExample
//
//  Created by Chris on 04/02/2020.
//  Copyright © 2020 Chris Nevin. All rights reserved.
//

import Domain
import UIKit

extension PopCoordinator where Self: UINavigationController {
    func pop() {
        popViewController(animated: true)
    }
}

extension PushCoordinator where Self: UINavigationController {
    func push(_ any: Any) {
        pushViewController(any as! UIViewController, animated: true)
    }
}
