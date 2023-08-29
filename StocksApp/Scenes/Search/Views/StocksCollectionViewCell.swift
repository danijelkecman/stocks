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
  func update(with row: StocksRow) {
    titleLabel.text = row.title
    subtitleLabel.text = row.subtitle
  }
}

// MARK: - Private methods
private extension StocksCollectionViewCell {
  func setupViews() {
    setupTitleLabel()
    setupSubtitleLabel()
  }
  
  func setupTitleLabel() {
    contentView.addSubview(titleLabel)
    
    titleLabel.font = .custom(type: .regular, size: 16)
    titleLabel.textColor = .black
    titleLabel.textAlignment = .center
    titleLabel.numberOfLines = 2
    
    titleLabel.snp.makeConstraints {
      $0.top.leading.equalToSuperview().inset(8)
    }
  }
  
  func setupSubtitleLabel() {
    contentView.addSubview(subtitleLabel)
    
    subtitleLabel.font = .custom(type: .italic, size: 10)
    subtitleLabel.textColor = .gray
    subtitleLabel.textAlignment = .center
    subtitleLabel.alpha = 0.7
    
    subtitleLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(4)
      $0.leading.equalToSuperview().inset(8)
    }
  }
}
