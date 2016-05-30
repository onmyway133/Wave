//
//  ViewKeyframeAction.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public final class KeyframeAction: ViewConfigurable {

    let _animation = View.KeyframeAnimation()
    public var view: UIView?

    public var animation: View.Animation {
      return _animation
    }

    public init() {

    }
  }
}

extension View.KeyframeAction: Action {

  public func run(nextActions: [Action]) {
    UIView.animateKeyframesWithDuration(animation.duration, delay: animation.delay,
                                        options: _animation.options,
                                        animations:
      {
        self._animation.items.forEach { item in
          UIView.addKeyframeWithRelativeStartTime(item.startTime,
            relativeDuration:
            item.duration,
            animations: item.block)
        }

        self._animation.block?()

      }, completion: { _ in
        Wave.run(nextActions)
    })
  }
}

public extension Chain where A: View.KeyframeAction {

  public func add(startTime: NSTimeInterval = 0, duration: NSTimeInterval = 0, block: Block) -> Chain {
    return configure { (action: View.KeyframeAction) in
      if let animation = action.animation as? View.KeyframeAnimation {
        let item = View.KeyframeAnimationItem(block: block)
        item.startTime = startTime
        item.duration = duration

        animation.items.append(item)
      }
    }
  }
}
