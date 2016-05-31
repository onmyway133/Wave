//
//  ViewBasicAction.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public final class BasicAction: ViewBasicAnimationConfigurable {

    let _animation = View.BasicAnimation()
    public var view: UIView?

    public var animation: View.Animation {
      return _animation
    }

    public init() {

    }
  }
}

extension View.BasicAction: Action {

  public func run(nextActions: [Action]) {
    UIView.animateWithDuration(animation.duration, delay: _animation.delay, options: _animation.options,
                               animations:
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
