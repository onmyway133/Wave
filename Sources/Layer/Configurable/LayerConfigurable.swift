//
//  LayerConfigurable.swift
//  Wave
//
//  Created by Khoa Pham on 28/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public protocol LayerConfigurable: class {

  associatedtype Animation: CAAnimation

  func configureAnimation(block: Animation -> Void) -> Self
}

public extension LayerConfigurable {

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
}
