//
//  StocksAPI+Endpoints.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/29/23.
//

import Foundation

extension StocksAPI {
  enum Endpoints: EndpointEncodable {
    case list
    
    var path: Path {
      switch self {
      case .list:
        return "stocks"
      }
    }
  }
}
