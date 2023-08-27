//
//  SearchResultViewController.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/27/23.
//

import UIKit

class SearchResultViewController: UIViewController {
  private lazy var contentView = SearchResultView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViews()
  }
  
  override func loadView() {
    view = contentView
  }
}

// MARK: - Private Methods
private extension SearchResultViewController {
  func setupViews() {
    view.backgroundColor = .systemBackground
  }
}
