//
//  ViewBasicAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public class ViewBasicAnimation: ViewAnimation {

  public var _options: UIViewAnimationOptions = []
  public var _block: Block?

  public override func run(completion: Block?) {
    UIView.animateWithDuration(_duration, delay: _delay, options: _options,
                               animations:
      {
        if self._repeatCount > 0 {
          UIView.setAnimationRepeatCount(Float(self._repeatCount))
        }

        self._block?()
      }, completion: { _ in
        completion?()
    })
  }
}

public extension ViewBasicAnimation {

  public func options(options: UIViewAnimationOptions) -> Self {
    _options = options
    return self
  }

  public func block(block: Block) -> Self {
    _block = block
    return self
  }
}
