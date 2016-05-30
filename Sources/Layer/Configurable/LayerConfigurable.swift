//
//  LayerConfigurable.swift
//  Wave
//
//  Created by Khoa Pham on 28/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public protocol LayerConfigurable: class {

  var animation: CAAnimation { get }
  var layer: CALayer? { get set }
}

// MARK: - Config

public extension Chain where A: LayerConfigurable {

  public func layer(layer: CALayer) -> Chain {
    return configure { (action: LayerConfigurable) in
      action.layer = layer
    }
  }
}

public extension Chain where A: LayerConfigurable {

  // MARK: - CAAnimation

  public func timingFunction(function: CAMediaTimingFunction) -> Chain {
    return configure { (action: LayerConfigurable) in
      action.animation.timingFunction = function
    }
  }

  public func delegate(delegate: AnyObject) -> Chain {
    return configure { (action: LayerConfigurable) in
      action.animation.delegate = delegate
    }
  }

  public func removedOnCompletion(removed: Bool) -> Chain {
    return configure { (action: LayerConfigurable) in
      action.animation.removedOnCompletion = removed
    }
  }

  // MARK: - CAMediaTiming

  public func beginTime(time: NSTimeInterval) -> Chain {
    return configure { (action: LayerConfigurable) in
      action.animation.beginTime = time
    }
  }

  public func timeOffset(time: NSTimeInterval) -> Chain {
    return configure { (action: LayerConfigurable) in
      action.animation.timeOffset = time
    }
  }

  public func repeatCount(count: Float) -> Chain {
    return configure { (action: LayerConfigurable) in
      action.animation.repeatCount = count
    }
  }

  public func repeatDuration(duration: NSTimeInterval) -> Chain {
    return configure { (action: LayerConfigurable) in
      action.animation.repeatDuration = duration
    }
  }

  public func duration(duration: NSTimeInterval) -> Chain {
    return configure { (action: LayerConfigurable) in
      action.animation.duration = duration
    }
  }

  public func speed(speed: Float) -> Chain {
    return configure { (action: LayerConfigurable) in
      action.animation.speed = speed
    }
  }

  public func autoreverses(autoreverses: Bool) -> Chain {
    return configure { (action: LayerConfigurable) in
      action.animation.autoreverses = autoreverses
    }
  }

  public func fillMode(fillMode: Layer.FillMode) -> Chain {
    return configure { (action: LayerConfigurable) in
      action.animation.fillMode = fillMode.value
    }
  }
}
