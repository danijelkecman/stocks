//
//  StocksCollectionViewCell.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/27/23.
//

import UIKit

class StocksCollectionViewCell: UICollectionViewCell {
  private let titleLabel = UILabel()
  private let subtitleLabel = UILabel()
  private let imageView = UIImageView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Public methods
extension StocksCollectionViewCell {
  // TODO: implement update from data source
}

// MARK: - Private methods
private extension StocksCollectionViewCell {
  func setupViews() {
    layer.masksToBounds = true
    layer.cornerRadius = 3
  }
  
  func setupImageView() {
    contentView.addSubview(imageView)
    
    imageView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  func setupTitleLabel() {
    contentView.addSubview(titleLabel)
    
    titleLabel.font = .custom(type: .regular, size: 16)
    titleLabel.textColor = .white
    titleLabel.textAlignment = .center
    titleLabel.numberOfLines = 2
  }
  
  func setupSubtitleLabel() {
    contentView.addSubview(subtitleLabel)
    
    subtitleLabel.font = .custom(type: .italic, size: 10)
    subtitleLabel.textColor = .white
    subtitleLabel.textAlignment = .center
    subtitleLabel.alpha = 0.7
  }
}
