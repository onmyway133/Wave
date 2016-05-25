//
//  Chainable.swift
//  Wave
//
//  Created by Khoa Pham on 24/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public protocol Chainable: class {

  var actions: [Action] { get set }
}

public extension Chainable {

  public func run() {
    Wave.run(actions)
  }
}

public extension Chainable {

  public func link<T: Chainable>(chain: T) -> T {
    var actions = self.actions
    actions.appendContentsOf(chain.actions)
    chain.actions = actions

    return chain
  }

  public func link(action: Action) -> Self {
    actions.append(action)
    return self
  }
}

public extension Chainable {

  public func wait(interval: NSTimeInterval) -> Self {
    let action = Wait(interval: interval)
    return link(action)
  }

  public func then(block: Block) -> Self {
    let action = Then(block: block)
    return link(action)
  }
}

public extension Chainable {

  public func configure<T: Action>(block: inout T -> Void) -> Self {
    if let action = actions.last as? T {
      var action = action
      block(&action)
      replaceLast(action)
    }

    return self
  }
  
  public func replaceLast(action: Action) {
    guard !actions.isEmpty else { return }

    actions[actions.count-1] = action
  }
}
