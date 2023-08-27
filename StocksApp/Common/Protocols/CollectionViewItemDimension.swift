//
//  CollectionViewItemDimension.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/27/23.
//

import UIKit

protocol ItemDimension {
  func sizeForItem(at indexPath: IndexPath) -> CGSize
}

protocol CollectionViewItemDimension {
  func sizeForItem(at indexPath: IndexPath, for collectionView: UICollectionView) -> CGSize
  
  var sectionInset: UIEdgeInsets { get }
  var lineSpacing: CGFloat { get }
  var interItemSpacing: CGFloat { get }
}
