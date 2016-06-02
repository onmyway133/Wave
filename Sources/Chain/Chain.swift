//
//  Chain.swift
//  Wave
//
//  Created by Khoa Pham on 30/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public final class Chain<A: Action> {

  var actions: [Action] = []

  public init() {
    
  }
}

// MARK: - Run

public extension Chain {

  public func run() {
    Wave.run(actions)
  }
}

// MARK: - Link

public extension Chain {

  public func link<B>(chain: Chain<B>) -> Chain<B> {
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

// MARK: - Action

public extension Chain {

  public func wait(interval: NSTimeInterval) -> Chain {
    var action = Wait()
    action.interval = interval

    return link(action)
  }

  public func custom(block: Block) -> Chain {
    var action = Custom()
    action.block = block
    
    return link(action)
  }

  public func log(string: String) -> Chain {
    return custom {
      print(string)
    }
  }
}

// MARK: - New Action

public extension Chain {

  public func newAction() -> Chain {
    let action = A()
    actions.append(action)

    // FIXME

    // Configure defaults for layer
    if let action = action as? LayerAnimationConfigurable {
      action.info.duration = Config.duration
      action.info.timingFunction = Config.timingFunction
    }

    // Assign last view
    if let action = action as? ViewConfigurable {
      let l: ViewConfigurable? = last()
      action.view = l?.view
    }

    // Assig last action
    if let action = action as? LayerConfigurable {
      let l: LayerConfigurable? = last()
      action.layer = l?.layer
    }

    return self
  }
}

// MARK: - Configure

public extension Chain {

  public func configure<T>(block: T -> Void) -> Chain {
    if let action = actions.last as? T {
      block(action)

      if let action = action as? Action {
        replaceLast(action)
      }
    }

    return self
  }

  public func replaceLast(action: Action) {
    guard !actions.isEmpty else { return }

    actions[actions.count-1] = action
  }

  public func last<T>() -> T? {
    return actions.last as? T
  }
}
