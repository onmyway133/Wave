//
//  LayerKeyframeChain.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension Layer {

  public final class KeyframeChain: Chainable {

    public var actions: [Action] = []
    public let layer: CALayer

    public init(layer: CALayer) {
      self.layer = layer
    }
  }
}

// MARK: - Configure

extension Layer.KeyframeChain: LayerPropertyConfigurable {

  public typealias Animation = CAKeyframeAnimation

  public func configureAnimation(block: CAKeyframeAnimation -> Void) -> Layer.KeyframeChain {
    return configure { (action: Layer.KeyframeAction) -> Layer.KeyframeAction in
      block(action.animation)
      return action
    }
  }
}

public extension Layer.KeyframeChain {

  public func values(values: [AnyObject]) -> Layer.KeyframeChain {
    return configureAnimation { (animation: CAKeyframeAnimation) in
      animation.values = values
    }
  }

  public func path(path: UIBezierPath) -> Layer.KeyframeChain {
    return configureAnimation { (animation: CAKeyframeAnimation) in
      animation.path = path.CGPath
    }
  }

  public func keyTimes(keyTimes: [NSNumber]) -> Layer.KeyframeChain {
    return configureAnimation { (animation: CAKeyframeAnimation) in
      animation.keyTimes = keyTimes
    }
  }

  public func timingFunctions(functions: [CAMediaTimingFunction]) -> Layer.KeyframeChain {
    return configureAnimation { (animation: CAKeyframeAnimation) in
      animation.timingFunctions = functions
    }
  }

  public func calculationMode(mode: Layer.CalculationMode) -> Layer.KeyframeChain {
    return configureAnimation { (animation: CAKeyframeAnimation) in
      animation.calculationMode = mode.value
    }
  }

  public func tensionValues(values: [NSNumber]) -> Layer.KeyframeChain {
    return configureAnimation { (animation: CAKeyframeAnimation) in
      animation.tensionValues = values
    }
  }

  public func continuityValues(values: [NSNumber]) -> Layer.KeyframeChain {
    return configureAnimation { (animation: CAKeyframeAnimation) in
      animation.continuityValues = values
    }
  }

  public func biasValues(values: [NSNumber]) -> Layer.KeyframeChain {
    return configureAnimation { (animation: CAKeyframeAnimation) in
      animation.biasValues = values
    }
  }

  public func rotationMode(mode: Layer.RotationMode) -> Layer.KeyframeChain {
    return configureAnimation { (animation: CAKeyframeAnimation) in
      animation.rotationMode = mode.value
    }
  }
}

// MARK: - Animate

extension Layer.KeyframeChain {

  public func animate(block: CABasicAnimation -> Void) -> Layer.KeyframeChain {
    var action = Layer.BasicAction()
    action.layer = layer
    block(action.animation)

    return link(action)
  }
}
