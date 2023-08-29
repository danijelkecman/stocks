//
//  ModelMapper.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/29/23.
//

import Foundation

protocol ModelMapper {
  associatedtype T
  associatedtype U
  static func map(response: [T]) -> [U]
  static func transform(response: T) -> U?
}

extension ModelMapper {
  static func map(response: [T]) -> [U] {
    response.compactMap { transform(response: $0) }
  }
}
