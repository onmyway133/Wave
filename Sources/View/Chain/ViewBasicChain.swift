//
//  ViewBasicChain.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public final class BasicChain: Chainable {

    public var actions: [Action] = []
    public let view: UIView

    public init(view: UIView) {
      self.view = view
    }
  }
}

// MARK: - Configure

public extension View.BasicChain {

  public func configureAnimation(block: View.BasicAnimation -> Void) -> View.BasicChain {
    return configure { (action: View.BasicAction) -> View.BasicAction in
      block(action.animation)
      return action
    }
  }

  public func duration(interval: NSTimeInterval) -> View.BasicChain {
    return configureAnimation { (animation: View.BasicAnimation) in
      animation.duration = interval
    }
  }

  public func delay(interval: NSTimeInterval) -> View.BasicChain {
    return configureAnimation { (animation: View.BasicAnimation) in
      animation.delay = interval
    }
  }

  public func replay(number: UInt) -> View.BasicChain {
    return configureAnimation { (animation: View.BasicAnimation) in
      animation.replay = number
    }
  }

  public func option(options: UIViewAnimationOptions) -> View.BasicChain {
    return configureAnimation { (animation: View.BasicAnimation) in
      animation.options = options
    }
  }
}

// MARK: - Animate

extension View.BasicChain: ViewAnimatable {

  public func animate(block: Block) -> View.BasicChain {
    let action = View.BasicAction()
    action.animation.block = block

    return link(action)
  }
}
