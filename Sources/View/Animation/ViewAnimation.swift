//
//  ViewAnimation.swift
//  Pods
//
//  Created by Khoa Pham on 04/06/16.
//
//

import UIKit

public class ViewAnimation {

  weak var _view: UIView?
  var _duration: NSTimeInterval = Config.duration
  var _delay: NSTimeInterval = Config.delay
  var _repeatCount: UInt = 0

  public init() {

  }

  public func run(completion: Block?) {
    completion?()
  }
}

public extension ViewAnimation {

  public func view(view: UIView) -> Self {
    _view = view
    return self
  }

  public func duration(interval: NSTimeInterval) -> Self {
    _duration = interval
    return self
  }

  public func delay(interval: NSTimeInterval) -> Self {
    _delay = interval
    return self
  }

  public func repeatCount(count: UInt) -> Self {
    _repeatCount = count
    return self
  }
}
