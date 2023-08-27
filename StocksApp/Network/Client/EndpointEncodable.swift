//
//  EndpointEncodable.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/27/23.
//

import Foundation
import PovioKitNetworking

protocol EndpointEncodable: URLConvertible {
  typealias Path = String
  typealias Headers = [String: String]
  
  var path: Path { get }
  var url: String { get }
}

extension EndpointEncodable {
  var url: String {
    "\(Host.current.baseURL)/\(path)"
  }
  
  func asURL() throws -> URL {
    .init(stringLiteral: url)
  }
}

extension EndpointEncodable where Self: RawRepresentable, Self.RawValue == String {
  var path: String {
    rawValue
  }
}
