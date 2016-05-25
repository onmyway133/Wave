//
//  ViewBasicChain.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public final class BasicChain: Chainable {

    public var actions: [Action] = []
    public let view: UIView

    public init(view: UIView) {
      self.view = view
    }
  }
}

public extension View.BasicChain {

  public func duration(interval: NSTimeInterval) -> View.BasicChain {
    return configure { (inout action: View.BasicAnimation) in
      action.duration = interval
    }
  }

  public func delay(interval: NSTimeInterval) -> View.BasicChain {
    return configure { (inout action: View.BasicAnimation) in
      action.delay = interval
    }
  }

  public func option(options: UIViewAnimationOptions) -> View.BasicChain {
    return configure { (inout action: View.BasicAnimation) in
      action.options = options
    }
  }

  public func replay(number: UInt) -> View.BasicChain {
    return configure { (inout action: View.BasicAnimation) in
      action.replay = number
    }
  }
}

public extension View.BasicChain {

  public func animate(block: Block) -> View.BasicChain {
    let action = View.BasicAnimation()
    return link(action)
  }

  public func moveX(value: CGFloat) -> View.BasicChain {
    return move(CGPoint(x: value, y: 0))
  }

  public func moveY(value: CGFloat) -> View.BasicChain {
    return move(CGPoint(x: 0, y: value))
  }

  public func move(value: CGPoint) -> View.BasicChain {
    return animate { [weak self] in
      self?.view.transform = CGAffineTransformMakeTranslation(value.x, value.y)
    }
  }

  public func scaleX(duration: NSTimeInterval = defaultDuration, value: CGFloat) -> View.BasicChain {
    return move(CGPoint(x: value, y: 0))
  }

  public func scaleY(duration: NSTimeInterval = defaultDuration, value: CGFloat) -> View.BasicChain {
    return move(CGPoint(x: 0, y: value))
  }

  public func scale(duration: NSTimeInterval = defaultDuration, value: CGPoint) -> View.BasicChain {
    return animate { [weak self] in
      self?.view.transform = CGAffineTransformMakeScale(value.x, value.y)
    }
  }

  public func rotate(duration: NSTimeInterval = defaultDuration, angle: CGFloat) -> View.BasicChain {
    return animate { [weak self] in
      self?.view.transform = CGAffineTransformMakeRotation(angle)
    }
  }

  public func zoom(duration: NSTimeInterval = defaultDuration, value: CGFloat) -> View.BasicChain {
    return scale(value: CGPoint(x: value, y: value))
  }

  public func fade(duration: NSTimeInterval = defaultDuration, visible: Bool) -> View.BasicChain {
    let action = View.BasicAnimation()

    actions.append(action)
    return self
  }

  public func fadeIn(duration: NSTimeInterval = defaultDuration, visible: Bool) -> View.BasicChain {
    return fade(duration, visible: true)
  }

  public func fadeOut(duration: NSTimeInterval = defaultDuration, visible: Bool) -> View.BasicChain {
    return fade(duration, visible: false)
  }
}
