//
//  HomeViewController.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/26/23.
//  
//

import UIKit

protocol HomeDisplayLogic: AnyObject {
  
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
    // setup title, navigation buttons, etc
    setupContentView()
  }
  
  func setupContentView() {
    // setup button targets, delegate, datasources, etc
  }
}
