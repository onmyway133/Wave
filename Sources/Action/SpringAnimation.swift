//
//  SpringAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 22/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

struct SpringAnimation: Action {

  let duration: NSTimeInterval
  let animation: () -> Void
  let damping: CGFloat
  let velocity: CGFloat

  init(duration: NSTimeInterval = 0, damping: CGFloat, velocity: CGFloat, animation: () -> Void) {
    self.duration = duration
    self.damping = damping
    self.velocity = velocity
    self.animation = animation
  }

  func run(nextActions: [Action]) {
    UIView.animateWithDuration(duration, delay: 0, usingSpringWithDamping: damping,
                               initialSpringVelocity: velocity, options: [], animations: animation,
                               completion: { finished in
                                Wave.run(nextActions)
    })
  }
}
