//
//  ViewTransitionChain.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public final class TransitionChain: Chainable {

    public var actions: [Action] = []

    public init() {

    }
  }
}

// MARK: - Configure

public extension View.TransitionChain {

  public func configureAnimation(block: View.TransitionAnimation -> Void) -> View.TransitionChain {
    return configure { (action: View.TransitionAction) -> View.TransitionAction in
      block(action.animation)
      return action
    }
  }

  public func duration(interval: NSTimeInterval) -> View.TransitionChain {
    return configureAnimation { (animation: View.TransitionAnimation) in
      animation.duration = interval
    }
  }

  public func option(options: UIViewAnimationOptions) -> View.TransitionChain {
    return configureAnimation { (animation: View.TransitionAnimation) in
      animation.options = options
    }
  }

  public func from(view: UIView) -> View.TransitionChain {
    return configureAnimation { (animation: View.TransitionAnimation) in
      animation.from = view
    }
  }

  public func to(view: UIView) -> View.TransitionChain {
    return configureAnimation { (animation: View.TransitionAnimation) in
      animation.to = view
    }
  }

  public func with(view: UIView) -> View.TransitionChain {
    return configureAnimation { (animation: View.TransitionAnimation) in
      animation.with = view
    }
  }

  public func block(block: UIView -> Void) -> View.TransitionChain {
    return configureAnimation { (animation: View.TransitionAnimation) in
      animation.block = block
    }
  }
}

// MARK: - Animate

extension View.TransitionChain: ViewAnimatable {

  public func animate() -> View.TransitionChain {
    let action = View.TransitionAction()
    return link(action)
  }
}
