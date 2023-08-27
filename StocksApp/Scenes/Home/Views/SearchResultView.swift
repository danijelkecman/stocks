//
//  SearchResultView.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/27/23.
//

import UIKit

class SearchResultView: UIView {
  let collectionViewDimensions = StocksCollectionViewItemDimension(numberOfItemsInRow: 2, insets: 8)
  let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
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
private extension SearchResultView {
  func setupViews() {
    backgroundColor = .systemBackground
    
    setupCollectionView()
    setupEmptyView()
  }
  
  func setupCollectionView() {
    addSubview(collectionView)
    collectionView.backgroundColor = .white
    collectionView.keyboardDismissMode = .onDrag
    collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    collectionView.register(StocksCollectionViewCell.self)
    (collectionView.collectionViewLayout as? UICollectionViewFlowLayout).map {
      $0.scrollDirection = .vertical
      $0.sectionInset = collectionViewDimensions.sectionInset
      $0.minimumLineSpacing = collectionViewDimensions.lineSpacing
      $0.minimumInteritemSpacing = collectionViewDimensions.interItemSpacing
    }
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
