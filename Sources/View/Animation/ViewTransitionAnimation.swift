//
//  ViewTransitionAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public final class TransitionAnimation: ViewConfigurable {

    let _info = View.TransitionAnimationInfo()
    public var view: UIView?

    public var info: ViewAnimationInfo {
      return _info
    }

    public init() {

    }
  }
}

extension View.TransitionAnimation: Action {

  public func run(nextActions: [Action]) {
    if let with = _info.with {
      UIView.transitionWithView(with, duration: info.duration, options: _info.options,
                                animations: {
                                  self._info.block?(with)
        }, completion: { _ in
          Wave.run(nextActions)
      })
    } else if let from = _info.from, to = _info.to {
      UIView.transitionFromView(from, toView: to, duration: info.duration, options: _info.options,
                                completion: { _ in
        Wave.run(nextActions)
      })
    }
  }
}

extension Chain where A: View.TransitionAnimation {

  public func duration(interval: NSTimeInterval) -> Chain {
    return configure { (animation: View.TransitionAnimation) in
      if let info = animation.info as? View.TransitionAnimationInfo {
        info.duration = interval
      }
    }
  }

  public func options(options: UIViewAnimationOptions) -> Chain {
    return configure { (animation: View.TransitionAnimation) in
      if let info = animation.info as? View.TransitionAnimationInfo {
        info.options = options
      }
    }
  }

  public func from(view: UIView) -> Chain {
    return configure { (animation: View.TransitionAnimation) in
      if let info = animation.info as? View.TransitionAnimationInfo {
        info.from = view
      }
    }
  }

  public func to(view: UIView) -> Chain {
    return configure { (animation: View.TransitionAnimation) in
      if let info = animation.info as? View.TransitionAnimationInfo {
        info.to = view
      }
    }
  }

  public func with(view: UIView) -> Chain {
    return configure { (animation: View.TransitionAnimation) in
      if let info = animation.info as? View.TransitionAnimationInfo {
        info.with = view
      }
    }
  }

  public func block(block: UIView -> Void) -> Chain {
    return configure { (animation: View.TransitionAnimation) in
      if let info = animation.info as? View.TransitionAnimationInfo {
        info.block = block
      }
    }
  }
}
