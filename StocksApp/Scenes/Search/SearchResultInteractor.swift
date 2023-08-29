//
//  SearchResultInteractor.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/29/23.
//  
//

import Foundation

protocol SearchResultBusinessLogic {
  func fetchStocks()
}

class SearchResultInteractor {
  var presenter: SearchResultPresentationLogic?
  
  private let stocksAPI: StocksAPI
  
  init(stocksAPI: StocksAPI = .init()) {
    self.stocksAPI = stocksAPI
  }
}

// MARK: - Business Logic
extension SearchResultInteractor: SearchResultBusinessLogic {
  func fetchStocks() {
    stocksAPI.fetchStocks()
      .finally { [weak self] in
        self?.presenter?.presentStocksResult($0)
      }
  }
}
