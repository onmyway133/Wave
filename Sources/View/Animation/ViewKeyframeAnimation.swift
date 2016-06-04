//
//  ViewKeyframeAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public final class ViewKeyframeAnimation: ViewAnimation {

  public var _options: UIViewKeyframeAnimationOptions = []
  public var _block: Block?
  public var _items: [ViewKeyframeAnimationItem] = []

  public override func run(completion: Block?) {
    UIView.animateKeyframesWithDuration(_duration, delay: _delay,
                                        options: _options,
                                        animations:
      {
        self._items.forEach { item in
          UIView.addKeyframeWithRelativeStartTime(item.startTime,
            relativeDuration:
            item.duration,
            animations: item.block)
        }

        self._block?()

      }, completion: { _ in
       completion?()
    })
  }
}

public extension ViewKeyframeAnimation {

  public func options(options: UIViewKeyframeAnimationOptions) -> Self {
    _options = options
    return self
  }

  public func options(block: Block) -> Self {
    _block = block
    return self
  }

  public func add(startTime: NSTimeInterval = 0, duration: NSTimeInterval = 0, block: Block) -> Self {
    let item = ViewKeyframeAnimationItem(block: block)
    item.startTime = startTime
    item.duration = duration

    _items.append(item)

    return self
  }
}

public final class ViewKeyframeAnimationItem {

  public var startTime: NSTimeInterval = 0
  public var duration: NSTimeInterval = 0
  public let block: Block

  public init(block: Block) {
    self.block = block
  }
}
