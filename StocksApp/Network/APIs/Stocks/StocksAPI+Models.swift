//
//  StocksAPI+Models.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/29/23.
//

import Foundation

extension StocksAPI {
  struct StocksContainer: Decodable {
    let stocks: [StockResponse]
  }
    
  struct StockResponse: Decodable {
    let id: Int
    let title: String
    let subtitle: String
  }
}
