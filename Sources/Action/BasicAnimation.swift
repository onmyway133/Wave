//
//  BasicAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 22/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

struct BasicAnimation: Action {

  let duration: NSTimeInterval
  let animation: () -> Void

  init(duration: NSTimeInterval = 0, animation: () -> Void) {
    self.duration = duration
    self.animation = animation
  }

  func run(nextActions: [Action]) {
    UIView.animateWithDuration(duration, delay: 0, options: [], animations: animation,
                               completion: { finished in
      Wave.run(nextActions)
    })
  }
}
