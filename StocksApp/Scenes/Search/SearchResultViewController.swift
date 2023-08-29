//
//  SearchResultViewController.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/29/23.
//  
//

import UIKit

protocol SearchResultDisplayLogic: AnyObject {
  func displayStocks(_ stocks: [Stock])
  func displayError(title: String, message: String)
}

class SearchResultViewController: UIViewController {
  var interactor: SearchResultBusinessLogic?
  var router: SearchResultRoutingLogic?
  private lazy var contentView = SearchResultContentView()
  private let dataSource = StocksDataSource()
  
  init(delegate: SearchResultRouterDelegate?) {
    super.init(nibName: nil, bundle: nil)
    let interactor = SearchResultInteractor()
    let presenter = SearchResultPresenter()
    let router = SearchResultRouter()
    interactor.presenter = presenter
    presenter.viewController = self
    router.viewController = self
    router.delegate = delegate
    self.interactor = interactor
    self.router = router
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    view = contentView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
}

// MARK: - Display Logic
extension SearchResultViewController: SearchResultDisplayLogic {
  func displayStocks(_ stocks: [Stock]) {
    dataSource.update(stocks: stocks)
    contentView.emptyView.isHidden = !stocks.isEmpty
  }
  
  func displayError(title: String, message: String) {
    //    router?.navigateToAlert(title: title, message: message, handler: nil)
    contentView.emptyView.isHidden = false
  }
}

// MARK: - Private Methods
private extension SearchResultViewController {
  func setupViews() {
    // setup title, navigation buttons, etc
    setupContentView()
  }
  
  func setupContentView() {
    // setup button targets, delegate, datasources, etc
    contentView.collectionView.delegate = self
    contentView.collectionView.dataSource = dataSource.create(with: contentView.collectionView)
    
    var stocks = [Stock]()
    for index in 0..<10 {
      stocks.append(Stock(id: index, title: "AAPL", subtitle: "Apple inc."))
    }
    dataSource.update(stocks: stocks)
    contentView.emptyView.isHidden = true
  }
}

// MARK: - Collection view delegate and flow layout
extension SearchResultViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    contentView.collectionViewDimensions.sizeForItem(at: indexPath, for: collectionView)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let row = dataSource.row(at: indexPath) else {
      Logger.error("No availible row in dataSource at \(indexPath)")
      return
    }
    switch row {
    case let stocksRow as StocksRow:
      Logger.info(stocksRow.title)
    case _:
      break
    }
  }
}
