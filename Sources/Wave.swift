//
//  Wave.swift
//  Wave
//
//  Created by Khoa Pham on 22/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit
import Construction

public typealias Block = () -> Void

public func run(actions: [Action]) {
  if let action = actions.first {
    action.run(Array(actions.dropFirst()))
  }
}

public extension UIView {

  public var chain: View.BasicChain {
    return View.BasicChain().with(self)
  }
}
