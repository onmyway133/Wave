//
//  ViewKeyframeChain.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public final class KeyframeChain: Chainable {

    public var actions: [Action] = []
    public var view: UIView?

    public init() {

    }
  }
}

// MARK: - Configure

extension View.KeyframeChain: ViewConfigurable {

}

public extension View.KeyframeChain {

  public func configureAnimation(block: View.KeyframeAnimation -> Void) -> View.KeyframeChain {
    return configure { (action: View.KeyframeAction) -> View.KeyframeAction in
      block(action.animation)
      return action
    }
  }

  public func add(startTime: NSTimeInterval = 0, duration: NSTimeInterval = 0, block: Block) -> View.KeyframeChain {
    return configureAnimation { (animation: View.KeyframeAnimation) in
      let item = View.KeyframeAnimationItem(block: block)
      item.startTime = startTime
      item.duration = duration

      animation.items.append(item)
    }
  }
}
