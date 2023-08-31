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
  var stockId: String { entity.id }
  var title: String { entity.title }
  var subtitle: String { entity.subtitle }
}
