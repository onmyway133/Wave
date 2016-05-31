//
//  LayerKeyframeAnimationConfigurable.swift
//  Wave
//
//  Created by Khoa Pham on 29/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public protocol LayerKeyframeAnimationConfigurable: LayerPropertyAnimationConfigurable {

}

// MARK: - Config

public extension Chain where A: LayerKeyframeAnimationConfigurable {

  public func values(values: [AnyObject]) -> Chain {
    return configure { (animation: LayerKeyframeAnimationConfigurable) in
      if let info = animation.info as? CAKeyframeAnimation {
        info.values = values
      }
    }
  }

  public func path(path: UIBezierPath) -> Chain {
    return configure { (animation: LayerKeyframeAnimationConfigurable) in
      if let info = animation.info as? CAKeyframeAnimation {
        info.path = path.CGPath
      }
    }
  }

  public func keyTimes(keyTimes: [NSNumber]) -> Chain {
    return configure { (animation: LayerKeyframeAnimationConfigurable) in
      if let info = animation.info as? CAKeyframeAnimation {
        info.keyTimes = keyTimes
      }
    }
  }

  public func timingFunctions(functions: [CAMediaTimingFunction]) -> Chain {
    return configure { (animation: LayerKeyframeAnimationConfigurable) in
      if let info = animation.info as? CAKeyframeAnimation {
        info.timingFunctions = functions
      }
    }
  }

  public func calculationMode(mode: Layer.CalculationMode) -> Chain {
    return configure { (animation: LayerKeyframeAnimationConfigurable) in
      if let info = animation.info as? CAKeyframeAnimation {
        info.calculationMode = mode.value
      }
    }
  }

  public func tensionValues(values: [NSNumber]) -> Chain {
    return configure { (animation: LayerKeyframeAnimationConfigurable) in
      if let info = animation.info as? CAKeyframeAnimation {
        info.values = values
      }
    }
  }

  public func continuityValues(values: [NSNumber]) -> Chain {
    return configure { (animation: LayerKeyframeAnimationConfigurable) in
      if let info = animation.info as? CAKeyframeAnimation {
        info.values = values
      }
    }
  }

  public func biasValues(values: [NSNumber]) -> Chain {
    return configure { (animation: LayerKeyframeAnimationConfigurable) in
      if let info = animation.info as? CAKeyframeAnimation {
        info.values = values
      }
    }
  }

  public func rotationMode(mode: Layer.RotationMode) -> Chain {
    return configure { (animation: LayerKeyframeAnimationConfigurable) in
      if let info = animation.info as? CAKeyframeAnimation {
        info.rotationMode = mode.value
      }
    }
  }
}

// MARK: - Animate

public extension Chain where A: LayerKeyframeAnimationConfigurable {

  public func shake() -> Chain {
    return
      keyPath("position.x")
      .values([0, 15, -15, 15, 0])
  }

  public func pop() -> Chain {
    return
      keyPath("transform.scale")
      .values([0, 1.5, -1.5, 1.5, 0])
      .keyTimes([0, 0.2, 0.4, 0.6, 0.8, 1])
  }

  public func swing() -> Chain {
    return
      keyPath("transform.rotation")
      .values([0, 0.3, -0.3, 0.3, 0])
      .keyTimes([0, 0.2, 0.4, 0.6, 0.8, 1])
  }
}
