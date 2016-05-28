//
//  ViewSystemChain.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public final class SystemChain: Chainable {

    public var actions: [Action] = []
    public let views: [UIView]

    public init(views: [UIView]) {
      self.views = views
    }
  }
}

// MARK: - Configure

public extension View.SystemChain {

  public func configureAnimation(block: View.SystemAnimation -> Void) -> View.SystemChain {
    return configure { (action: View.SystemAction) -> View.SystemAction in
      block(action.animation)
      return action
    }
  }

  public func option(options: UIViewAnimationOptions) -> View.SystemChain {
    return configureAnimation { (animation: View.SystemAnimation) in
      animation.options = options
    }
  }

  public func parallelBlock(block: Block) -> View.SystemChain {
    return configureAnimation { (animation: View.SystemAnimation) in
      animation.parallelBlock = block
    }
  }
}

// MARK: - Animate

public extension View.SystemChain {

  public func animate() -> View.SystemChain {
    let action = View.SystemAction()
    action.animation.views = views

    return link(action)
  }
}
