//
//  LayerKeyframeAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public final class LayerKeyframeAnimation: LayerPropertyAnimation {

  public override init() {
    super.init()
    info = CAKeyframeAnimation()
  }
}

public extension LayerKeyframeAnimation {

  public func values(values: [AnyObject]) -> Self {
    (info as? CAKeyframeAnimation)?.values = values
    return self
  }

  public func path(path: UIBezierPath) -> Self {
    (info as? CAKeyframeAnimation)?.path = path.CGPath
    return self
  }

  public func keyTimes(keyTimes: [NSNumber]) -> Self {
    (info as? CAKeyframeAnimation)?.keyTimes = keyTimes
    return self
  }

  public func timingFunctions(functions: [CAMediaTimingFunction]) -> Self {
    (info as? CAKeyframeAnimation)?.timingFunctions = functions
    return self
  }

  public func calculationMode(mode: Layer.CalculationMode) -> Self {
    (info as? CAKeyframeAnimation)?.calculationMode = mode.value
    return self
  }

  public func tensionValues(values: [NSNumber]) -> Self {
    (info as? CAKeyframeAnimation)?.values = values
    return self
  }

  public func continuityValues(values: [NSNumber]) -> Self {
    (info as? CAKeyframeAnimation)?.values = values
    return self
  }

  public func biasValues(values: [NSNumber]) -> Self {
    (info as? CAKeyframeAnimation)?.values = values
    return self
  }

  public func rotationMode(mode: Layer.RotationMode) -> Self {
    (info as? CAKeyframeAnimation)?.rotationMode = mode.value
    return self
  }
}

