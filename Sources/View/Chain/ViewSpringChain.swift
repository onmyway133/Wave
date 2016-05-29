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

extension View.SpringChain: ViewBasicConfigurable {

  public typealias Animation = View.SpringAnimation

  public func configureAnimation(block: View.SpringAnimation -> Void) -> View.SpringChain {
    return configure { (action: View.SpringAction) -> View.SpringAction in
      block(action.animation)
      return action
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
}

// MARK: - Animate

extension View.SpringChain: ViewBasicAnimatable {

  public func animate(block: Block) -> View.SpringChain {
    let action = View.SpringAction()
    action.animation.block = block

    return link(action)
  }
}
