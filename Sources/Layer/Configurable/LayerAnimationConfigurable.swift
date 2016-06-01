//
//  LayerAnimationConfigurable.swift
//  Wave
//
//  Created by Khoa Pham on 31/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public protocol LayerAnimationConfigurable: class {

  var info: CAAnimation { get }
}

public extension Chain where A: LayerAnimationConfigurable {

  // MARK: - CAAnimation

  public func timingFunction(function: CAMediaTimingFunction) -> Chain {
    return configure { (animation: LayerAnimationConfigurable) in
      animation.info.timingFunction = function
    }
  }

  public func delegate(delegate: AnyObject) -> Chain {
    return configure { (animation: LayerAnimationConfigurable) in
      animation.info.delegate = delegate
    }
  }

  public func removedOnCompletion(removed: Bool) -> Chain {
    return configure { (animation: LayerAnimationConfigurable) in
      animation.info.removedOnCompletion = removed
    }
  }

  // MARK: - CAMediaTiming

  public func beginTime(time: NSTimeInterval) -> Chain {
    return configure { (animation: LayerAnimationConfigurable) in
      animation.info.beginTime = time
    }
  }

  public func timeOffset(time: NSTimeInterval) -> Chain {
    return configure { (animation: LayerAnimationConfigurable) in
      animation.info.timeOffset = time
    }
  }

  public func repeatCount(count: Float) -> Chain {
    return configure { (animation: LayerAnimationConfigurable) in
      animation.info.repeatCount = count
    }
  }

  public func repeatDuration(duration: NSTimeInterval) -> Chain {
    return configure { (animation: LayerAnimationConfigurable) in
      animation.info.repeatDuration = duration
    }
  }

  public func duration(duration: NSTimeInterval) -> Chain {
    return configure { (animation: LayerAnimationConfigurable) in
      animation.info.duration = duration
    }
  }

  public func speed(speed: Float) -> Chain {
    return configure { (animation: LayerAnimationConfigurable) in
      animation.info.speed = speed
    }
  }

  public func autoreverses(autoreverses: Bool) -> Chain {
    return configure { (animation: LayerAnimationConfigurable) in
      animation.info.autoreverses = autoreverses
    }
  }

  public func fillMode(fillMode: Layer.FillMode) -> Chain {
    return configure { (animation: LayerAnimationConfigurable) in
      animation.info.fillMode = fillMode.value
    }
  }
}

public extension Chain where A: LayerAnimationConfigurable  {

  public func defaultConfig() -> Chain {
    return duration(Config.duration)
      .timingFunction(Config.timingFunction)
  }

  public func coolConfig() -> Chain {
    return duration(0.5)
      .timingFunction(Layer.TimingFunction.EaseIn)
  }
}
