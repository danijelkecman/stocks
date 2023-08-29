//
//  JSONDecoder+Stocks.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/29/23.
//

import Foundation

extension JSONDecoder {
  static var `default`: JSONDecoder {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
  }
  
  static var defaultKeys: JSONDecoder {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .useDefaultKeys
    return decoder
  }
}
