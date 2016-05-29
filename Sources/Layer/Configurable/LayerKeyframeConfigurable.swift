//
//  LayerKeyframeConfigurable.swift
//  Wave
//
//  Created by Khoa Pham on 29/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public protocol LayerKeyframeConfigurable: LayerPropertyConfigurable {

  associatedtype Animation: CAKeyframeAnimation
}

public extension LayerKeyframeConfigurable {

  public func values(values: [AnyObject]) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.values = values
    }
  }

  public func path(path: UIBezierPath) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.path = path.CGPath
    }
  }

  public func keyTimes(keyTimes: [NSNumber]) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.keyTimes = keyTimes
    }
  }

  public func timingFunctions(functions: [CAMediaTimingFunction]) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.timingFunctions = functions
    }
  }

  public func calculationMode(mode: Layer.CalculationMode) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.calculationMode = mode.value
    }
  }

  public func tensionValues(values: [NSNumber]) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.tensionValues = values
    }
  }

  public func continuityValues(values: [NSNumber]) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.continuityValues = values
    }
  }

  public func biasValues(values: [NSNumber]) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.biasValues = values
    }
  }

  public func rotationMode(mode: Layer.RotationMode) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.rotationMode = mode.value
    }
  }
}
