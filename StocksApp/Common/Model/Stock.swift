//
//  Stock.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/27/23.
//

import Foundation

struct Stock: Identifiable {
  let id: String
  let title: String
  let subtitle: String
  
  var identifier: String {
    id
  }
}

extension Stock: Equatable, Hashable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(identifier)
  }
  
  static func == (lhs: Stock, rhs: Stock) -> Bool {
    lhs.identifier == rhs.identifier
  }
}
