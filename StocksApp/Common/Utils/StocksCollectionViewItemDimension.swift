//
//  StocksCollectionViewItemDimension.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/27/23.
//

import UIKit

struct StocksCollectionViewItemDimension: CollectionViewItemDimension {
  let numberOfItemsInRow: Int
  let insets: CGFloat
  let defaultWidth: CGFloat = 85
  let defaultHeight: CGFloat = 100
  
  init(numberOfItemsInRow: Int, insets: CGFloat) {
    self.numberOfItemsInRow = numberOfItemsInRow
    self.insets = insets
  }
}

extension StocksCollectionViewItemDimension {
  var sectionInset: UIEdgeInsets {
    .init(top: insets, left: insets, bottom: insets, right: insets)
  }
  
  var lineSpacing: CGFloat {
    insets
  }
  
  var interItemSpacing: CGFloat {
    insets
  }
  
  func sizeForItem(at indexPath: IndexPath, for collectionView: UICollectionView) -> CGSize {
    let aspect = defaultHeight / defaultWidth
    
    let leftAndRightInset = insets * 2
    let spacing = interItemSpacing * CGFloat(numberOfItemsInRow - 1)
    let itemWidth = (collectionView.bounds.width - leftAndRightInset - spacing) / CGFloat(numberOfItemsInRow)
    
    return CGSize(width: floor(itemWidth), height: floor(itemWidth * aspect))
  }
}
