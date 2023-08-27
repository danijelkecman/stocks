//
//  StocksDataSource.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/27/23.
//

import Foundation
import OrderedCollections
import PovioKitCore
import UIKit

class StocksDataSource {
  typealias Section = StocksSection
  typealias Row = AnyHashable
  typealias DataSource = UICollectionViewDiffableDataSource<Section, Row>
  typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Row>
  
  private var diffableDataSource: DataSource?
  private var stocks = OrderedSet<Stock>()
}

// MARK: - Public Methods
extension StocksDataSource {
  func update(stocks: [Stock]) {
    self.stocks.removeAll()
    self.stocks.append(contentsOf: stocks)

    build(animated: true)
  }
      
  func row(at indexPath: IndexPath) -> Row? {
    diffableDataSource?.itemIdentifier(for: indexPath)
  }
  
  func create(with collectionView: UICollectionView) -> DataSource? {
    diffableDataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, row in
      return nil
    }
    
    return diffableDataSource
  }
}

// MARK: - Private Methods
private extension StocksDataSource {
  func build(animated: Bool) {
    let rows: [StocksRow] = stocks.map(StocksRow.init)
    
    var snapshot = Snapshot()
    snapshot.appendSections(Section.allCases)
    snapshot.appendItems(rows)
    diffableDataSource?.apply(snapshot, animatingDifferences: animated)
  }
}
