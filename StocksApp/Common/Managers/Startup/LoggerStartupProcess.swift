//
//  LoggerStartupProcess.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/27/23.
//

import PovioKitCore
import UIKit

class LoggerStartupProcess: StartupProcess {
  func run(completion: @escaping (Bool) -> Void) {
    Logger.shared.logLevel = Constants.Environment.isDebug ? .debug : .info
    completion(true)
  }
}
