//
//  ViewKeyframeAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public final class KeyframeAnimation: ViewConfigurable {

    let _info = View.KeyframeAnimationInfo()
    public var view: UIView?

    public var info: ViewAnimationInfo {
      return _info
    }

    public init() {

    }
  }
}

extension View.KeyframeAnimation: Action {

  public func run(nextActions: [Action]) {
    UIView.animateKeyframesWithDuration(info.duration, delay: info.delay,
                                        options: _info.options,
                                        animations:
      {
        self._info.items.forEach { item in
          UIView.addKeyframeWithRelativeStartTime(item.startTime,
            relativeDuration:
            item.duration,
            animations: item.block)
        }

        self._info.block?()

      }, completion: { _ in
        Wave.run(nextActions)
    })
  }
}

public extension Chain where A: View.KeyframeAnimation {

  public func add(startTime: NSTimeInterval = 0, duration: NSTimeInterval = 0, block: Block) -> Chain {
    return configure { (animation: View.KeyframeAnimation) in
      if let info = animation.info as? View.KeyframeAnimationInfo {
        let item = View.KeyframeAnimationInfoItem(block: block)
        item.startTime = startTime
        item.duration = duration

        info.items.append(item)
      }
    }
  }
}
