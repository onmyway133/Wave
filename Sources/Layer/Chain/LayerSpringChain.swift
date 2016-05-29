//
//  LayerSpringChain.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension Layer {

  @available(iOS 9, *)
  public final class SpringChain: Chainable {

    public var actions: [Action] = []
    public let layer: CALayer

    public init(layer: CALayer) {
      self.layer = layer
    }
  }
}

// MARK: - Configure

extension Layer.SpringChain: LayerBasicConfigurable {

  @available(iOS 9, *)
  public typealias Animation = CASpringAnimation

  public func configureAnimation(block: CASpringAnimation -> Void) -> Layer.SpringChain {
    return configure { (action: Layer.SpringAction) -> Layer.SpringAction in
      block(action.animation)
      return action
    }
  }
}

public extension Layer.SpringChain {

  public func mass(value: Double) -> Layer.SpringChain {
    return configureAnimation { (animation: CASpringAnimation) in
      animation.mass = CGFloat(value)
    }
  }

  public func stiffness(value: Double) -> Layer.SpringChain {
    return configureAnimation { (animation: CASpringAnimation) in
      animation.stiffness = CGFloat(value)
    }
  }

  public func damping(value: Double) -> Layer.SpringChain {
    return configureAnimation { (animation: CASpringAnimation) in
      animation.damping = CGFloat(value)
    }
  }

  public func initialVelocity(value: Double) -> Layer.SpringChain {
    return configureAnimation { (animation: CASpringAnimation) in
      animation.initialVelocity = CGFloat(value)
    }
  }
}

// MARK: - Animate

extension Layer.SpringChain: LayerAnimatable {

  @available(iOS 9, *)
  public func animate(block: CASpringAnimation -> Void) -> Layer.SpringChain {
    var action = Layer.SpringAction()
    action.layer = layer
    block(action.animation)

    return link(action)
  }
}
