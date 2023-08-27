//
//  AlamofireNetworkClient+Stocks.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/27/23.
//

import Alamofire
import Foundation
import PovioKitNetworking

extension AlamofireNetworkClient {
  static var `default`: AlamofireNetworkClient {
    let session: Session = {
      let configuration = URLSessionConfiguration.af.default
      configuration.timeoutIntervalForRequest = 60
      configuration.waitsForConnectivity = true
      return Session(configuration: configuration,
                     eventMonitors: [AlamofireConsoleLogger()])
    }()
    
    return .init(session: session, eventMonitors: [])
  }
}
