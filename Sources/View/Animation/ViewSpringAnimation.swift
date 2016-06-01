//
//  ViewSpringAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public final class SpringAnimation: ViewConfigurable, ViewBasicAnimationConfigurable {

    let _info = View.SpringAnimationInfo()
    public var view: UIView?

    public var info: ViewAnimationInfo {
      return _info
    }

    public init() {

    }
  }
}

extension View.SpringAnimation: Action {

  public func run(nextActions: [Action]) {
    UIView.animateWithDuration(info.duration, delay: info.delay,
                               usingSpringWithDamping: _info.damping,
                               initialSpringVelocity: _info.velocity,
                               options: _info.options, animations:
      {
        if let replay = self.info.replay {
          UIView.setAnimationRepeatCount(Float(replay))
        }

        self._info.block?()
      }, completion: { _ in
        Wave.run(nextActions)
    })
  }
}

public extension Chain where A: View.SpringAnimation {

  public func damping(value: CGFloat) -> Chain {
    return configure { (animation: View.SpringAnimation) in
      if let info = animation.info as? View.SpringAnimationInfo {
        info.damping = value
      }
    }
  }

  public func velocity(value: CGFloat) -> Chain {
    return configure { (animation: View.SpringAnimation) in
      if let info = animation.info as? View.SpringAnimationInfo {
        info.damping = value
      }
    }
  }
}
