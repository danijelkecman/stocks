//
//  HomeViewController.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/26/23.
//
//

import UIKit

protocol HomeDisplayLogic: AnyObject {
  // TODO: not yet implemented
}

class HomeViewController: UIViewController {
  var interactor: HomeBusinessLogic?
  var router: HomeRoutingLogic?
  private lazy var contentView = HomeContentView()
  
  init(delegate: HomeRouterDelegate?) {
    super.init(nibName: nil, bundle: nil)
    let interactor = HomeInteractor()
    let presenter = HomePresenter()
    let router = HomeRouter()
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
extension HomeViewController: HomeDisplayLogic {
}

// MARK: - Private Methods
private extension HomeViewController {
  func setupViews() {
    setupTitleView()
    setupSearchController()
    setupContentView()
  }
  
  func setupContentView() {
    // setup button targets, delegate, datasources, etc
  }
  
  func setupSearchController() {
    let resultViewController = SearchResultViewController(delegate: nil)
    let searchController = UISearchController(searchResultsController: resultViewController)
    navigationItem.searchController = searchController
    searchController.searchResultsUpdater = self
  }
  
  func setupTitleView() {
    let titleLabel = UILabel()
    titleLabel.font = .systemFont(ofSize: 40, weight: .medium)
    titleLabel.text = "Stocks"
    titleLabel.textColor = .white
    
    let leftBarButton = UIBarButtonItem(customView: titleLabel)
    navigationItem.leftBarButtonItem = leftBarButton
  }
}

// MARK: - Search Result Updating Delegate
extension HomeViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    guard let query = searchController.searchBar.text,
            let resultViewController = searchController.searchResultsController as? SearchResultViewController,
          !query.trimmingCharacters(in: .whitespaces).isEmpty else { return }
    Logger.info(query)
  }
}
