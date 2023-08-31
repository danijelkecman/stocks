//
//  StocksAPI+Mappers.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/29/23.
//

import Foundation

extension StocksAPI {
  struct StocksMapper: ModelMapper {
    static func transform(response: StocksContainer) -> [Stock]? {
      response.result.map {
        Stock(
          id: UUID().uuidString,
          title: $0.symbol,
          subtitle: $0.description
        )
      }
    }
  }
}
