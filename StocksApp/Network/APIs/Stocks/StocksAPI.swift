//
//  StocksAPI.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/29/23.
//

import Foundation
import PovioKitNetworking

class StocksAPI {
  private let client: AlamofireNetworkClient
  
  init(client: AlamofireNetworkClient = .default) {
    self.client = client
  }
  
  func fetchStocks() -> Promise<[Stock]> {
    client
      .request(method: .get, endpoint: Endpoints.list)
      .validate()
      .decode(StocksContainer.self, decoder: .default)
      .compactMap(with: StocksMapper.transform)
  }
}
