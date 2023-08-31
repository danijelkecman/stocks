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
  
  func fetchStocks(with stocks: [String]) -> Promise<[Stock]> {
    client
      .request(method: .get, endpoint: Endpoints.search(stocks: stocks), headers: ["X-Finnhub-Token": Constants.Network.apiKey])
      .validate()
      .decode(StocksContainer.self, decoder: .default)
      .compactMap(with: StocksMapper.transform)
  }
}
