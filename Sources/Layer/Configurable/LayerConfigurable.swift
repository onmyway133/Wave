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

  // MARK: - CAMediaTiming

  public func beginTime(time: NSTimeInterval) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.beginTime = CFTimeInterval(time)
    }
  }

  public func timeOffset(time: NSTimeInterval) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.timeOffset = CFTimeInterval(time)
    }
  }

  public func repeatCount(count: Float) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.repeatCount = count
    }
  }

  public func repeatDuration(duration: NSTimeInterval) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.repeatDuration = CFTimeInterval(duration)
    }
  }

  public func duration(duration: NSTimeInterval) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.duration = CFTimeInterval(duration)
    }
  }

  public func speed(speed: Float) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.speed = speed
    }
  }

  public func autoreverses(autoreverses: Bool) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.autoreverses = autoreverses
    }
  }

  public func fillMode(fillMode: Layer.FillMode) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.fillMode = fillMode.value
    }
  }
}
