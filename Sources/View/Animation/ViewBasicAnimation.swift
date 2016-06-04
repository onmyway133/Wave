//
//  ViewBasicAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public class ViewBasicAnimation: ViewAnimation {

  var _options: UIViewAnimationOptions = []
  var _block: Block?

  public override func run(completion: Block?) {
    UIView.animateWithDuration(_duration, delay: _delay, options: _options,
                               animations:
      {
        if self._repeatCount > 0 {
          UIView.setAnimationRepeatCount(Float(self._repeatCount))
        }

        self._block?()
      }, completion: { _ in
        completion?()
    })
  }
}

public extension ViewBasicAnimation {

  public func options(options: UIViewAnimationOptions) -> Self {
    _options = options
    return self
  }

  public func block(block: Block) -> Self {
    _block = block
    return self
  }
}

public extension ViewBasicAnimation {

  // MARK: - Move

  public func moveX(value: Double) -> Self {
    return move(CGPoint(x: value, y: 0))
  }

  public func moveY(value: Double) -> Self {
    return move(CGPoint(x: 0, y: value))
  }

  public func move(value: CGPoint) -> Self {
    weak var view = _view

    return block {
      view?.frame.origin.x += value.x
      view?.frame.origin.y += value.y
    }
  }

  // MARK: - Translation

  public func translateX(value: Double) -> Self {
    return translate(CGPoint(x: value, y: 0))
  }

  public func translateY(value: Double) -> Self {
    return translate(CGPoint(x: 0, y: value))
  }

  public func translate(value: CGPoint) -> Self {
    weak var view = _view

    return block {
      view?.transform = CGAffineTransformMakeTranslation(value.x, value.y)
    }
  }

  // MARK: - Scale

  public func scaleX(value: Double) -> Self {
    return scale(CGPoint(x: value, y: 0))
  }

  public func scaleY(value: Double) -> Self {
    return scale(CGPoint(x: 0, y: value))
  }

  public func scale(value: CGPoint) -> Self {
    weak var view = _view

    return block {
      view?.transform = CGAffineTransformMakeScale(value.x, value.y)
    }
  }

  // MARK: - Zoom

  public func zoom(value: Double) -> Self {
    return scale(CGPoint(x: value, y: value))
  }

  // MARK: - Rotate

  public func rotate(radian: Double) -> Self {
    weak var view = _view

    return block {
      view?.transform = CGAffineTransformMakeRotation(CGFloat(radian))
    }
  }

  // MARK: - Fade

  public func fade(visible: Bool) -> Self {
    weak var view = _view

    return block {
      view?.alpha = visible ? 1 : 0
    }
  }

  public func fadeIn() -> Self {
    return fade(true)
  }

  public func fadeOut() -> Self {
    return fade(false)
  }

  // MARK: - Color

  public func changeBackground(color: UIColor) -> Self {
    weak var view = _view

    return block {
      view?.backgroundColor = color
    }
  }

}
