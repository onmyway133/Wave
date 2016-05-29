//
//  Wave.swift
//  Wave
//
//  Created by Khoa Pham on 22/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit
import Construction

// MARK: - Typealias

public typealias Block = () -> Void

// MARK: - Run

public func run(actions: [Action]) {
  if let action = actions.first {
    action.run(Array(actions.dropFirst()))
  }
}

// MARK: - Chain

public extension UIView {

  public var chain: View.BasicChain {
    return View.BasicChain().with(self)
  }
}

// MARK: - Ride
