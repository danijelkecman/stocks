//
//  StocksAPI+Models.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/29/23.
//

import Foundation

extension StocksAPI {
  struct StocksContainer: Decodable {
    let count: Int
    let result: [StockResponse]
  }
    
  struct StockResponse: Decodable {
    let description: String
    let displaySymbol: String
    let symbol: String
    let type: String
  }
}
