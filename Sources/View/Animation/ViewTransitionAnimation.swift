//
//  ViewTransitionAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public final class ViewTransitionAnimation: ViewAnimation {

  var _options: UIViewAnimationOptions = []
  var _from: UIView?
  var _to: UIView?
  var _with: UIView?
  var _block: (UIView -> Void)?

  public override func run(completion: Block?) {

    if let with = _with {
      UIView.transitionWithView(with, duration: _duration, options: _options,
                                animations: {
                                  self._block?(with)
        }, completion: { _ in
          completion?()
      })
    } else if let from = _from, to = _to {
      UIView.transitionFromView(from, toView: to, duration: _duration, options: _options,
                                completion: { _ in
                                  completion?()
      })
    }
  }
}

public extension ViewTransitionAnimation {

  public func options(options: UIViewAnimationOptions) -> Self {
    _options = options
    return self
  }

  public func from(view: UIView) -> Self {
    _from = view
    return self
  }

  public func to(view: UIView) -> Self {
    _to = view
    return self
  }

  public func with(view: UIView) -> Self {
    _with = view
    return self
  }

  public func block(block: UIView -> Void) -> Self {
    _block = block
    return self
  }
}

