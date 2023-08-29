//
//  SearchResultContentView.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/29/23.
//  
//

import UIKit

class SearchResultContentView: UIView {
  let collectionViewDimensions = StocksCollectionViewItemDimension(numberOfItemsInRow: 1, insets: 0)
  var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
  let emptyView = EmptyView()
  
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
private extension SearchResultContentView {
  func setupViews() {
    backgroundColor = .systemBackground
    
    setupCollectionViewConfiguration()
    setupCollectionView()
    setupEmptyView()
  }
  
  func setupCollectionViewConfiguration() {
    var config = UICollectionLayoutListConfiguration(appearance: .plain)
    config.showsSeparators = false
    let layout = UICollectionViewCompositionalLayout.list(using: config)
    collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
    collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
  }
  
  func setupCollectionView() {
    addSubview(collectionView)
    collectionView.backgroundColor = .white
    collectionView.keyboardDismissMode = .onDrag
    collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    collectionView.register(StocksCollectionViewCell.self)
    collectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  func setupEmptyView() {
    addSubview(emptyView)
    
    emptyView.text = "No content"
    emptyView.snp.makeConstraints {
      $0.leading.top.trailing.bottom.equalToSuperview()
    }
  }
}
