//
//  HomeRouter.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/26/23.
//  
//

import Foundation

protocol HomeRoutingLogic {
  // TODO: not yet implemented
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
}
