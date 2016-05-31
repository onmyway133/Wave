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
    return configure { (action: ViewBasicAnimationConfigurable) in
      action.animation.duration = interval
    }
  }

  public func delay(interval: NSTimeInterval) -> Chain {
    return configure { (action: ViewBasicAnimationConfigurable) in
      action.animation.delay = interval
    }
  }

  public func replay(number: UInt) -> Chain {
    return configure { (action: ViewBasicAnimationConfigurable) in
      action.animation.replay = number
    }
  }

  public func options(options: UIViewAnimationOptions) -> Chain {
    return configure { (action: ViewBasicAnimationConfigurable) in
      if let animation = action.animation as? View.BasicAnimation {
        animation.options = options
      }
    }
  }

  public func block(block: Block) -> Chain {
    return configure { (action: ViewBasicAnimationConfigurable) in
      if let animation = action.animation as? View.BasicAnimation {
        animation.block = block
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
    let action: ViewConfigurable? = last()

    return newAction().block {
      action?.view?.transform = CGAffineTransformMakeTranslation(value.x, value.y)
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
    let action: ViewConfigurable? = last()

    return newAction().block {
      action?.view?.transform = CGAffineTransformMakeScale(value.x, value.y)
    }
  }

  // MARK: - Zoom

  public func zoom(value: Double) -> Chain {
    return scale(CGPoint(x: value, y: value))
  }

  // MARK: - Rotate

  public func rotate(angle: Double) -> Chain {
    let action: ViewConfigurable? = last()

    return newAction().block {
      action?.view?.transform = CGAffineTransformMakeRotation(CGFloat(angle))
    }
  }

  // MARK: - Fade

  public func fade(visible: Bool) -> Chain {
    let action: ViewConfigurable? = last()
    
    return newAction().block {
      action?.view?.alpha = visible ? 1 : 0
    }
  }

  public func fadeIn(visible: Bool) -> Chain {
    return fade(true)
  }

  public func fadeOut(visible: Bool) -> Chain {
    return fade(false)
  }
}
