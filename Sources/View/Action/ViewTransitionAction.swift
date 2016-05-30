//
//  ViewTransitionAction.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public final class TransitionAction: ViewConfigurable {

    let _animation = View.TransitionAnimation()
    public var view: UIView?

    public var animation: View.Animation {
      return _animation
    }

    public init() {

    }
  }
}

extension View.TransitionAction: Action {

  public func run(nextActions: [Action]) {
    if let with = _animation.with {
      UIView.transitionWithView(with, duration: animation.duration, options: _animation.options,
                                animations: {
                                  self._animation.block?(with)
        }, completion: { _ in
          Wave.run(nextActions)
      })
    } else if let from = _animation.from, to = _animation.to {
      UIView.transitionFromView(from, toView: to, duration: animation.duration, options: _animation.options,
                                completion: { _ in
        Wave.run(nextActions)
      })
    }
  }
}

extension Chain where A: View.TransitionAction {

  public func duration(interval: NSTimeInterval) -> Chain {
    return configure { (action: View.TransitionAction) in
      if let animation = action.animation as? View.TransitionAnimation {
        animation.duration = interval
      }
    }
  }

  public func options(options: UIViewAnimationOptions) -> Chain {
    return configure { (action: View.TransitionAction) in
      if let animation = action.animation as? View.TransitionAnimation {
        animation.options = options
      }
    }
  }

  public func from(view: UIView) -> Chain {
    return configure { (action: View.TransitionAction) in
      if let animation = action.animation as? View.TransitionAnimation {
        animation.from = view
      }
    }
  }

  public func to(view: UIView) -> Chain {
    return configure { (action: View.TransitionAction) in
      if let animation = action.animation as? View.TransitionAnimation {
        animation.to = view
      }
    }
  }

  public func with(view: UIView) -> Chain {
    return configure { (action: View.TransitionAction) in
      if let animation = action.animation as? View.TransitionAnimation {
        animation.with = view
      }
    }
  }

  public func block(block: UIView -> Void) -> Chain {
    return configure { (action: View.TransitionAction) in
      if let animation = action.animation as? View.TransitionAnimation {
        animation.block = block
      }
    }
  }
}
