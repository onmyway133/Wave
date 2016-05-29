//
//  ViewKeyframeAction.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public struct KeyframeAction {

    let animation = View.KeyframeAnimation()
  }
}

extension View.KeyframeAction: Action {

  public func run(nextActions: [Action]) {
    UIView.animateKeyframesWithDuration(animation.duration, delay: animation.delay, options: animation.options,
                                        animations:
      {
        self.animation.items.forEach { item in
          UIView.addKeyframeWithRelativeStartTime(item.startTime,
            relativeDuration:
            item.duration,
            animations: item.block)
        }

        self.animation.block?()

      }, completion: { _ in
        Wave.run(nextActions)
    })
  }
}
