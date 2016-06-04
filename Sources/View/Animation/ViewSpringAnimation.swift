//
//  ViewSpringAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public final class ViewSpringAnimation: ViewBasicAnimation {

  var _damping: CGFloat = 1
  var _velocity: CGFloat = 1

  public override func run(completion: Block?) {
    UIView.animateWithDuration(_duration, delay: _delay,
                               usingSpringWithDamping: _damping,
                               initialSpringVelocity: _velocity,
                               options: _options, animations:
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

public extension ViewSpringAnimation {

  public func damping(damping: CGFloat) -> Self {
    _damping = damping
    return self
  }

  public func velocity(velocity: CGFloat) -> Self {
    _velocity = velocity
    return self
  }
}
