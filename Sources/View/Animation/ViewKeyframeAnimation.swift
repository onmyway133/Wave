//
//  ViewKeyframeAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public struct KeyframeAnimation {

    var duration: NSTimeInterval = Wave.defaultDuration
    var delay: NSTimeInterval = Wave.defaultDelay
    var replay: UInt?
    var options: UIViewKeyframeAnimationOptions = []
    var block: Block?
  }
}

extension View.KeyframeAnimation: Action {

  public func run(nextActions: [Action]) {
    UIView.animateKeyframesWithDuration(duration, delay: delay, options: options,
                                        animations:
      {

      }, completion: { _ in
        Wave.run(nextActions)
    })
  }
}
