//
//  Host.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/27/23.
//

import Foundation

enum Host {
  case development
  case production
}

extension Host {
  var baseURL: String {
    switch self {
    case .development:
      return "http://flowrspot-api.herokuapp.com/api"
    case .production:
      return "http://prod-flowrspot-api.herokuapp.com/api"
    }
  }
  
  static var current: Host {
    Constants.Environment.isDebug ? .development : .production
  }
}
