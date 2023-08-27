//
//  StocksRow.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/27/23.
//

import Foundation

struct StocksRow: Hashable {
  let entity: Stock
}

extension StocksRow {
  var stockId: Int { entity.id }
}
