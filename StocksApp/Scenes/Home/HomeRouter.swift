//
//  HomeRouter.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/26/23.
//  
//

import UIKit

protocol HomeRoutingLogic {
  func navigateToAlert(title: String, message: String, handler: (() -> Void)?)
}

protocol HomeRouterDelegate: AnyObject {
  // TODO: not yet implemented
}

class HomeRouter {
  weak var viewController: HomeViewController?
  weak var delegate: HomeRouterDelegate?
}

// MARK: - Routing Logic
extension HomeRouter: HomeRoutingLogic {
  func navigateToAlert(title: String, message: String, handler: (() -> Void)?) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "general_ok".localized(), style: .cancel) { _ in handler?() })
    viewController?.present(alert, animated: true, completion: nil)
  }
}
