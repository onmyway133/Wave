//
//  LayerBasicConfigurable.swift
//  Wave
//
//  Created by Khoa Pham on 29/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public protocol LayerBasicConfigurable: LayerConfigurable {

  associatedtype Animation: CABasicAnimation

  func configureAnimation(block: Animation -> Void) -> Self
}

public extension LayerBasicConfigurable {

  // MARK: - CAAnimation

  public func timingFunction(function: CAMediaTimingFunction) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.timingFunction = function
    }
  }

  public func delegate(delegate: AnyObject) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.delegate = delegate
    }
  }

  public func removedOnCompletion(removed: Bool) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.removedOnCompletion = removed
    }
  }

  // MARK: - CAPropertyAnimation

  public func keyPath(keyPath: String) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.keyPath = keyPath
    }
  }

  public func additive(additive: Bool) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.additive = additive
    }
  }

  public func cumulative(cumulative: Bool) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.cumulative = cumulative
    }
  }

  public func valueFunction(function: CAValueFunction) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.valueFunction = function
    }
  }

  // MARK: - CABasicAnimation

  public func fromValue(value: AnyObject) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.fromValue = value
    }
  }

  public func toValue(value: AnyObject) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.toValue = value
    }
  }

  public func byValue(value: AnyObject) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.byValue = value
    }
  }

}
