//
//  NavigationController.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/27/23.
//

import UIKit

class NavigationController: UINavigationController {
  override func viewDidLoad() {
    super.viewDidLoad()
//    setupViews()
  }
}

// MARK: - Private methods
private extension NavigationController {
  func setupViews() {
    navigationBar.barTintColor = .white
    navigationBar.titleTextAttributes = [.font: UIFont.custom(type: .bold, size: 17),
                                         .foregroundColor: UIColor.stockPink]
    navigationBar.setBackgroundImage(UIImage(), for: .top, barMetrics: .default)
    navigationBar.shadowImage = UIImage()
    navigationBar.tintColor = .white
    navigationBar.layer.masksToBounds = false
    
    let backgroundColor = UIColor.white
    navigationBar.barTintColor = backgroundColor
    navigationBar.backgroundColor = backgroundColor
    navigationBar.isTranslucent = false
    
    navigationBar.layer.shadowColor = UIColor.black.cgColor
    navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
    navigationBar.layer.shadowRadius = 10.0
    navigationBar.layer.shadowOpacity = 0.1
    navigationBar.layer.masksToBounds = false
    
    if #available(iOS 15, *) {
      let appearance = UINavigationBarAppearance()
      appearance.configureWithOpaqueBackground()
      appearance.backgroundColor = backgroundColor
      appearance.shadowColor = .clear
      navigationBar.standardAppearance = appearance
      navigationBar.scrollEdgeAppearance = appearance
    }
  }
}

extension UIViewController {
  func addLogoToNavigationBar() {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    imageView.contentMode = .scaleAspectFit
//    imageView.image = UIImage(.logo)

    let contentView = UIView()
    self.navigationItem.titleView = contentView
    self.navigationItem.titleView?.addSubview(imageView)
    imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
  }
}
