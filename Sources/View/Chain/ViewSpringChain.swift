//
//  ViewSpringChain.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public final class SpringChain: Chainable {
    
    public var actions: [Action] = []
    public var view: UIView?

    public init() {
      
    }

  }
}

// MARK: - Configure

extension View.SpringChain: ViewConfigurable {

}

public extension View.SpringChain {

  public func configureAnimation(block: View.SpringAnimation -> Void) -> View.SpringChain {
    return configure { (action: View.SpringAction) -> View.SpringAction in
      block(action.animation)
      return action
    }
  }

  public func option(options: UIViewAnimationOptions) -> View.SpringChain {
    return configureAnimation { (animation: View.SpringAnimation) in
      animation.options = options
    }
  }

  public func damping(value: CGFloat) -> View.SpringChain {
    return configureAnimation { (animation: View.SpringAnimation) in
      animation.damping = value
    }
  }

  public func velocity(value: CGFloat) -> View.SpringChain {
    return configureAnimation { (animation: View.SpringAnimation) in
      animation.velocity = value
    }
  }

  public func replay(number: UInt) -> View.SpringChain {
    return configureAnimation { (animation: View.SpringAnimation) in
      animation.replay = number
    }
  }
}


// MARK: - Animate

extension View.SpringChain: ViewAnimatable {

  public func animate(block: Block) -> View.SpringChain {
    let action = View.SpringAction()
    action.animation.block = block

    return link(action)
  }
}
