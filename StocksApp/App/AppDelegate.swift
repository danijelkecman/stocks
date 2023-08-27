//
//  AppDelegate.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/26/23.
//

import AlamofireNetworkActivityLogger
import PovioKitCore
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {
  private(set) var flowController: FlowController?
}

extension AppDelegate: UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    guard !Constants.Environment.isTesting else { return true }
        
    NetworkActivityLogger.shared.level = .debug
    NetworkActivityLogger.shared.startLogging()
    
    StartupProcessService()
      .execute(process: LoggerStartupProcess())
      .execute(process: FlowControllerStartupProcess { self.flowController = $0 })
    
    return true
  }
}
