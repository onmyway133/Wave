//
//  ViewBasicAnimationConfigurable.swift
//  Wave
//
//  Created by Khoa Pham on 29/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public protocol ViewBasicAnimationConfigurable: ViewAnimationConfigurable {

}

// MARK: - Configure

public extension Chain where A: ViewBasicAnimationConfigurable {

  public func duration(interval: NSTimeInterval) -> Chain {
    return configure { (animation: ViewBasicAnimationConfigurable) in
      animation.info.duration = interval
    }
  }

  public func delay(interval: NSTimeInterval) -> Chain {
    return configure { (animation: ViewBasicAnimationConfigurable) in
      animation.info.delay = interval
    }
  }

  public func replay(number: UInt) -> Chain {
    return configure { (animation: ViewBasicAnimationConfigurable) in
      animation.info.replay = number
    }
  }

  public func options(options: UIViewAnimationOptions) -> Chain {
    return configure { (animation: ViewBasicAnimationConfigurable) in
      if let info = animation.info as? View.BasicAnimationInfo {
        info.options = options
      }
    }
  }

  public func block(block: Block) -> Chain {
    return configure { (animation: ViewBasicAnimationConfigurable) in
      if let info = animation.info as? View.BasicAnimationInfo {
        info.block = block
      }
    }
  }
}

// MARk: - Animate

public extension Chain where A: ViewBasicAnimationConfigurable {

  // MARK: - Move

  public func moveX(value: Double) -> Chain {
    return move(CGPoint(x: value, y: 0))
  }

  public func moveY(value: Double) -> Chain {
    return move(CGPoint(x: 0, y: value))
  }

  public func move(value: CGPoint) -> Chain {
    let animation: ViewConfigurable? = last()
    weak var view = animation?.view

    return newAction().block {
      view?.transform = CGAffineTransformMakeTranslation(value.x, value.y)
    }
  }

  // MARK: - Scale

  public func scaleX(value: Double) -> Chain {
    return move(CGPoint(x: value, y: 0))
  }

  public func scaleY(value: Double) -> Chain {
    return move(CGPoint(x: 0, y: value))
  }

  public func scale(value: CGPoint) -> Chain {
    let animation: ViewConfigurable? = last()
    weak var view = animation?.view

    return newAction().block {
      view?.transform = CGAffineTransformMakeScale(value.x, value.y)
    }
  }

  // MARK: - Zoom

  public func zoom(value: Double) -> Chain {
    return scale(CGPoint(x: value, y: value))
  }

  // MARK: - Rotate

  public func rotate(angle: Double) -> Chain {
    let animation: ViewConfigurable? = last()
    weak var view = animation?.view

    return newAction().block {
      view?.transform = CGAffineTransformMakeRotation(CGFloat(angle))
    }
  }

  // MARK: - Fade

  public func fade(visible: Bool) -> Chain {
    let animation: ViewConfigurable? = last()
    weak var view = animation?.view
    
    return newAction().block {
      view?.alpha = visible ? 1 : 0
    }
  }

  public func fadeIn(visible: Bool) -> Chain {
    return fade(true)
  }

  public func fadeOut(visible: Bool) -> Chain {
    return fade(false)
  }
}
