//
//  ViewSpringAction.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public final class SpringAction: ViewBasicAnimationConfigurable {

    let _animation = View.SpringAnimation()
    public var view: UIView?

    public var animation: View.Animation {
      return _animation
    }

    public init() {

    }
  }
}

extension View.SpringAction: Action {

  public func run(nextActions: [Action]) {
    UIView.animateWithDuration(animation.duration, delay: animation.delay,
                               usingSpringWithDamping: _animation.damping,
                               initialSpringVelocity: _animation.velocity,
                               options: _animation.options, animations:
      {
        if let replay = self.animation.replay {
          UIView.setAnimationRepeatCount(Float(replay))
        }

        self._animation.block?()
      }, completion: { _ in
        Wave.run(nextActions)
    })
  }
}

public extension Chain where A: View.SpringAction {

  public func damping(value: CGFloat) -> Chain {
    return configure { (action: View.SpringAction) in
      if let animation = action.animation as? View.SpringAnimation {
        animation.damping = value
      }
    }
  }

  public func velocity(value: CGFloat) -> Chain {
    return configure { (action: View.SpringAction) in
      if let animation = action.animation as? View.SpringAnimation {
        animation.damping = value
      }
    }
  }
}
