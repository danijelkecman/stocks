//
//  SearchResultPresenter.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/29/23.
//  
//

import Foundation

protocol SearchResultPresentationLogic {
  func presentStocksResult(_ result: Result<[Stock], Error>)
}

class SearchResultPresenter {
  weak var viewController: SearchResultDisplayLogic?
}

// MARK: - Presentation Logic
extension SearchResultPresenter: SearchResultPresentationLogic {
  func presentStocksResult(_ result: Result<[Stock], Error>) {
    switch result {
    case .success(let stocks):
      viewController?.displayStocks(stocks)
    case .failure(let error):
      Logger.error(String(describing: error))
      viewController?.displayError(
        title: "Error fetching stocks",
        message: error.localizedDescription
      )
    }
  }
}
