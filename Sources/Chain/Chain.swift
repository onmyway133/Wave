//
//  Chain.swift
//  Wave
//
//  Created by Khoa Pham on 23/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit
import Construction

public final class Chain {

  public var actions: [Action] = []
  let view: UIView

  public init(view: UIView) {
    self.view = view
  }

  public func finalize() {
    Chain.run(actions)
  }
}

public extension Chain {
  
  public static func run(actions: [Action]) {
    if let action = actions.first {
      action.run(Array(actions.dropFirst()))
    }
  }
}

public extension Chain {

  public func run(action: Action) -> Chain {
    actions.append(action)
    return self
  }

  public func delay(interval: NSTimeInterval) -> Chain {
    let action = Delay(interval: interval)
    return run(action)
  }

  public func animate(duration duration: NSTimeInterval = defaultDuration, block: Block) -> Chain {
    let action = Animation(duration: duration, block: block)
    return run(action)
  }
}
