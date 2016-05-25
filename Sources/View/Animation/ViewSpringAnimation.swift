//
//  ViewSpringAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public struct SpringAnimation: Action {

    var duration: NSTimeInterval = Wave.defaultDuration
    var delay: NSTimeInterval = Wave.defaultDelay
    var options: UIViewAnimationOptions = []
    var replay: UInt?
    var damping: CGFloat = 1
    var velocity: CGFloat = 1
    var block: Block?

    public func run(nextActions: [Action]) {
      UIView.animateWithDuration(duration, delay: delay,
                                 usingSpringWithDamping: damping, initialSpringVelocity: velocity,
                                 options: options, animations:
        {
          if let replay = self.replay {
            UIView.setAnimationRepeatCount(Float(replay))
          }

          self.block?()
        }, completion: { _ in
          Wave.run(nextActions)
      })
    }
  }
}
