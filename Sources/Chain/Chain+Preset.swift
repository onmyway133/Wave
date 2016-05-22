//
//  Chain+Preset.swift
//  Wave
//
//  Created by Khoa Pham on 23/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension Chain {

  public func moveX(duration: NSTimeInterval = defaultDuration, value: CGFloat) -> Chain {
    return move(duration, value: CGPoint(x: value, y: 0))
  }

  public func moveY(duration: NSTimeInterval = defaultDuration, value: CGFloat) -> Chain {
    return move(duration, value: CGPoint(x: 0, y: value))
  }

  public func move(duration: NSTimeInterval = defaultDuration, value: CGPoint) -> Chain {
    return animate(duration: duration) { [weak self] in
      self?.view.transform = CGAffineTransformMakeTranslation(value.x, value.y)
    }
  }
}

public extension Chain {

  public func scaleX(duration: NSTimeInterval = defaultDuration, value: CGFloat) -> Chain {
    return move(duration, value: CGPoint(x: value, y: 0))
  }

  public func scaleY(duration: NSTimeInterval = defaultDuration, value: CGFloat) -> Chain {
    return move(duration, value: CGPoint(x: 0, y: value))
  }

  public func scale(duration: NSTimeInterval = defaultDuration, value: CGPoint) -> Chain {
    return animate(duration: duration) { [weak self] in
      self?.view.transform = CGAffineTransformMakeScale(value.x, value.y)
    }
  }
}

public extension Chain {

  public func rotate(duration: NSTimeInterval = defaultDuration, angle: CGFloat) -> Chain {
    return animate(duration: duration) { [weak self] in
      self?.view.transform = CGAffineTransformMakeRotation(angle)
    }
  }
}

public extension Chain {

  public func zoom(duration: NSTimeInterval = defaultDuration, value: CGFloat) -> Chain {
    return scale(value: CGPoint(x: value, y: value))
  }
}

public extension Chain {

  public func fade(duration: NSTimeInterval = defaultDuration, visible: Bool) -> Chain {
    let action = Animation(duration: duration) { [weak self] in
      self?.view.alpha = visible ? 1 : 0
    }

    actions.append(action)
    return self
  }

  public func fadeIn(duration: NSTimeInterval = defaultDuration, visible: Bool) -> Chain {
    return fade(duration, visible: true)
  }

  public func fadeOut(duration: NSTimeInterval = defaultDuration, visible: Bool) -> Chain {
    return fade(duration, visible: false)
  }
}
