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
    let url = "\(Host.current.baseURL)/\(Version.v1.rawValue)/\(path)"
    Logger.info(url)
    return url
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
