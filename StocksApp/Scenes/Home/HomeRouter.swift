//
//  HomeRouter.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/26/23.
//  
//

import Foundation

protocol HomeRoutingLogic {
  
}

protocol HomeRouterDelegate: AnyObject {
  
}

class HomeRouter {
  weak var viewController: HomeViewController?
  weak var delegate: HomeRouterDelegate?
}

// MARK: - Routing Logic
extension HomeRouter: HomeRoutingLogic {
  
}
