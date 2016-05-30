//
//  LayerKeyframeConfigurable.swift
//  Wave
//
//  Created by Khoa Pham on 29/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public protocol LayerKeyframeConfigurable: LayerPropertyConfigurable {

}

// MARK: - Config

public extension Chain where A: LayerKeyframeConfigurable {

  public func values(values: [AnyObject]) -> Chain {
    return configure { (action: LayerKeyframeConfigurable) in
      if let animation = action.animation as? CAKeyframeAnimation {
        animation.values = values
      }
    }
  }

  public func path(path: UIBezierPath) -> Chain {
    return configure { (action: LayerKeyframeConfigurable) in
      if let animation = action.animation as? CAKeyframeAnimation {
        animation.path = path.CGPath
      }
    }
  }

  public func keyTimes(keyTimes: [NSNumber]) -> Chain {
    return configure { (action: LayerKeyframeConfigurable) in
      if let animation = action.animation as? CAKeyframeAnimation {
        animation.keyTimes = keyTimes
      }
    }
  }

  public func timingFunctions(functions: [CAMediaTimingFunction]) -> Chain {
    return configure { (action: LayerKeyframeConfigurable) in
      if let animation = action.animation as? CAKeyframeAnimation {
        animation.timingFunctions = functions
      }
    }
  }

  public func calculationMode(mode: Layer.CalculationMode) -> Chain {
    return configure { (action: LayerKeyframeConfigurable) in
      if let animation = action.animation as? CAKeyframeAnimation {
        animation.calculationMode = mode.value
      }
    }
  }

  public func tensionValues(values: [NSNumber]) -> Chain {
    return configure { (action: LayerKeyframeConfigurable) in
      if let animation = action.animation as? CAKeyframeAnimation {
        animation.values = values
      }
    }
  }

  public func continuityValues(values: [NSNumber]) -> Chain {
    return configure { (action: LayerKeyframeConfigurable) in
      if let animation = action.animation as? CAKeyframeAnimation {
        animation.values = values
      }
    }
  }

  public func biasValues(values: [NSNumber]) -> Chain {
    return configure { (action: LayerKeyframeConfigurable) in
      if let animation = action.animation as? CAKeyframeAnimation {
        animation.values = values
      }
    }
  }

  public func rotationMode(mode: Layer.RotationMode) -> Chain {
    return configure { (action: LayerKeyframeConfigurable) in
      if let animation = action.animation as? CAKeyframeAnimation {
        animation.rotationMode = mode.value
      }
    }
  }
}

// MARK: - Animate

public extension Chain where A: LayerKeyframeConfigurable {

  public func shake() -> Chain {
    return animate()
      .keyPath("position.x")
      .values([0, 15, -15, 15, 0])
      .defaults()
  }

  public func pop() -> Chain {
    return animate()
      .keyPath("transform.scale")
      .values([0, 1.5, -1.5, 1.5, 0])
      .keyTimes([0, 0.2, 0.4, 0.6, 0.8, 1])
      .defaults()
  }

  public func swing() -> Chain {
    return animate()
      .keyPath("transform.rotation")
      .values([0, 0.3, -0.3, 0.3, 0])
      .keyTimes([0, 0.2, 0.4, 0.6, 0.8, 1])
      .defaults()
  }
}
