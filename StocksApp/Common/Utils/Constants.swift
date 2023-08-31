//
//  Constants.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/27/23.
//

import Foundation

enum Constants {
  /// Environment constants
  enum Environment {
    #if DEBUG
    static let isDebug = true
    #else
    static let isDebug = false
    #endif
    
    static let isTesting = ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
    static let isDebugOrTest = isDebug || isTesting
  }
  
  enum Network {
    static let apiKey = "cfrs8nhr01qr5t5sk54gcfrs8nhr01qr5t5sk550"
    static let sandboxApiKey = ""
  }
}
