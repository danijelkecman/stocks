//
//  UIFont+Stocks.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/27/23.
//

import UIKit

extension UIFont {
  static func custom(type: FontStyle, size: CGFloat) -> UIFont {
    UIFont(name: type.name, size: size) ?? .systemFont(ofSize: size)
  }
}

public enum FontStyle: String {
  case light = "Light"
  case regular = "Regular"
  case semibold = "Medium"
  case bold = "Bold"
  case italicLight = "LightItalic"
  case italic = "Italic"
  case italicSemibold = "MediumItalic"
  case italicBold = "BoldItalic"
}

extension FontStyle {
  static let fontFamilyName = "Ubuntu"
  
  var name: String {
    switch self {
    case .regular:
      return FontStyle.fontFamilyName
    case .light, .semibold, .bold, .italicLight, .italic, .italicSemibold, .italicBold:
      return "\(FontStyle.fontFamilyName)-\(rawValue)"
    }
  }
}

extension UIFont {
  func fontWithFeature(key: Int, value: Int) -> UIFont {
    let originalDesc = self.fontDescriptor
    let features: [UIFontDescriptor.AttributeName: Any] = [
      UIFontDescriptor.AttributeName.featureSettings: [
        [
          UIFontDescriptor.FeatureKey.type: key,
          UIFontDescriptor.FeatureKey.selector: value
        ]
      ]
    ]
    let newDesc = originalDesc.addingAttributes(features)
    return UIFont(descriptor: newDesc, size: 0.0)
  }
  
  func fontWithHighLegibility() -> UIFont {
    let font = self.fontWithFeature(key: kStylisticAlternativesType, value: kStylisticAltSixOnSelector)
    return font
  }
}
