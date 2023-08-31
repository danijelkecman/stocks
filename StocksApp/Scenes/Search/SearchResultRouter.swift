//
//  SearchResultRouter.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/29/23.
//  
//

import UIKit

protocol SearchResultRoutingLogic {
  func navigateToAlert(title: String, message: String, handler: (() -> Void)?)
  func dismissViewController(stock: String)
}

protocol SearchResultRouterDelegate: AnyObject {
  func stockSelected(stock: String)
}

class SearchResultRouter {
  weak var viewController: SearchResultViewController?
  weak var delegate: SearchResultRouterDelegate?
}

// MARK: - Routing Logic
extension SearchResultRouter: SearchResultRoutingLogic {
  func dismissViewController(stock: String) {
    viewController?.dismiss(animated: true) {
      self.delegate?.stockSelected(stock: stock)
    }
  }
  
  func navigateToAlert(title: String, message: String, handler: (() -> Void)?) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "general_ok".localized(), style: .cancel) { _ in handler?() })
    viewController?.present(alert, animated: true, completion: nil)
  }
}
