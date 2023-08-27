//
//  PersistenceManager.swift
//  StocksApp
//
//  Created by Danijel Kecman on 8/27/23.
//

import Foundation

final class PersistenceManager {
  static let shared = PersistenceManager()
  
  private let userDefaults: UserDefaults = .standard

  private init() {}
  
  // MARK: - Public
  var watchList: [String] {
    return []
  }
  
  func addToWatchlist() {
    // TODO: implement
  }
  
  func removeFromWatchlist() {
    // TODO: implement
  }
  
  // MARK: - Private
  private var hasOnboarded: Bool {
    return false
  }
}
