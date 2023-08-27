//
//  HomeContentView.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/26/23.
//  
//

import UIKit

class HomeContentView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Private Methods
private extension HomeContentView {
  func setupViews() {
    backgroundColor = .systemBackground
  }
}
