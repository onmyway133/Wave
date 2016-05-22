//
//  KeyframeAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 22/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

struct KeyframeAnimation: Action {

  let duration: NSTimeInterval

  init(duration: NSTimeInterval = 0, animation: () -> Void) {
    self.duration = duration
  }

  func run(nextActions: [Action]) {
    UIView.animateKeyframesWithDuration(duration, delay: 0, options: [], animations: { 

    }, completion: { finished in
      Wave.run(nextActions)
    })
  }
}
