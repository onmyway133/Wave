//
//  ViewSystemAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public final class ViewSystemAnimation: ViewAnimation {

  var _options: UIViewAnimationOptions = []
  var _views: [UIView] = []
  var _animation: UISystemAnimation = .Delete
  var _parallelBlock: Block?

  public override func run(completion: Block?) {

    UIView.performSystemAnimation(_animation, onViews: _views, options: _options,
                                  animations:
      {
        if self._repeatCount > 0 {
          UIView.setAnimationRepeatCount(Float(self._repeatCount))
        }
        
        self._parallelBlock?()
      }, completion: { _ in
        completion?()
    })
  }
}

public extension ViewSystemAnimation {

  public func options(options: UIViewAnimationOptions) -> Self {
    _options = options
    return self
  }

  public func views(views: [UIView]) -> Self {
    _views = views
    return self
  }

  public func animation(animation: UISystemAnimation) -> Self {
    _animation = animation
    return self
  }

  public func parallelBlock(block: Block) -> Self {
    _parallelBlock = block
    return self
  }
}
