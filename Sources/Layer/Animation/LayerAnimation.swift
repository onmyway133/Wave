//
//  LayerAnimation.swift
//  Pods
//
//  Created by Khoa Pham on 04/06/16.
//
//

import UIKit

public class LayerAnimation {

  public var info: CAAnimation!

  public init() {
    info = CAAnimation()
  }
}

public extension LayerAnimation {

  // MARK: - CAAnimation

  public func timingFunction(function: CAMediaTimingFunction) -> Self {
    info.timingFunction = function
    return self
  }

  public func delegate(delegate: AnyObject) -> Self {
    info.delegate = delegate
    return self
  }

  public func removedOnCompletion(removed: Bool) -> Self {
    info.removedOnCompletion = removed
    return self
  }

  // MARK: - CAMediaTiming

  public func beginTime(time: NSTimeInterval) -> Self {
    info.beginTime = time
    return self
  }

  public func timeOffset(time: NSTimeInterval) -> Self {
    info.timeOffset = time
    return self
  }

  public func repeatCount(count: Float) -> Self {
    info.repeatCount = count
    return self
  }

  public func repeatDuration(duration: NSTimeInterval) -> Self {
    info.repeatDuration = duration
    return self
  }

  public func duration(duration: NSTimeInterval) -> Self {
    info.duration = duration
    return self
  }

  public func speed(speed: Float) -> Self {
    info.speed = speed
    return self
  }

  public func autoreverses(autoreverses: Bool) -> Self {
    info.autoreverses = autoreverses
    return self
  }

  public func fillMode(fillMode: Layer.FillMode) -> Self {
    info.fillMode = fillMode.value
    return self
  }
}

public extension LayerAnimation {

  public func coolConfig() -> Self {
    return
      duration(0.5)
      .timingFunction(Layer.TimingFunction.EaseIn)
  }
}
