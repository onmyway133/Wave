//
//  KeyframeAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 22/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public struct KeyframeAnimation: Action {

    let duration: NSTimeInterval
    let animation: () -> Void

    public init(duration: NSTimeInterval = 0, animation: () -> Void) {
      self.duration = duration
      self.animation = animation
    }

    public func run(nextActions: [Action]) {
      UIView.animateKeyframesWithDuration(duration, delay: 0, options: [], animations: animation,
                                          completion: { finished in
                                            Wave.run(nextActions)
      })
    }
  }
}

