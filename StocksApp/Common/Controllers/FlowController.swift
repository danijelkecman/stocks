//
//  FlowController.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/27/23.
//

import UIKit

class FlowController {
  let window: UIWindow
  
  init(window: UIWindow) {
    self.window = window
    self.window.makeKeyAndVisible()
  }
}

// MARK: - Public Methods
extension FlowController {
  func startAppFlow() {
    let viewController = HomeViewController(delegate: nil)
    let rootViewController = NavigationController(rootViewController: viewController)
    window.rootViewController = rootViewController
  }
}
