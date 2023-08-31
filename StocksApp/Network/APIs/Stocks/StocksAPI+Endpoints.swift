//
//  StocksAPI+Endpoints.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/29/23.
//

import Foundation

extension StocksAPI {
  enum Endpoints: EndpointEncodable {
    case search(stocks: [String])
    
    var path: Path {
      switch self {
      case .search(let stocks):
        let query = "search?" + stocks.map { "q=\($0)" }.joined(separator: "&")
        return query
      }
    }
  }
}
