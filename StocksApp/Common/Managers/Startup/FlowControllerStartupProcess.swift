//
//  FlowControllerStartupProcess.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/27/23.
//

import PovioKitCore
import UIKit

class FlowControllerStartupProcess: StartupProcess {
  private let completion: (FlowController) -> Void
  
  init(completion: @escaping (FlowController) -> Void) {
    self.completion = completion
  }
  
  func run(completion: @escaping (Bool) -> Void) {
    let window = UIWindow(frame: UIScreen.main.bounds)
    let flowController = FlowController(window: window)
    self.completion(flowController)
    flowController.startAppFlow()
    completion(true)
  }
}
