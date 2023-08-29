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
      response.stocks.map {
        return Stock(
          id: $0.id,
          title: $0.title,
          subtitle: $0.subtitle
        )
      }
    }
  }
}
