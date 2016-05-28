//
//  ViewTransitionAction.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public struct TransitionAction {

    let animation = View.TransitionAnimation()
  }
}

extension View.TransitionAction: Action {

  public func run(nextActions: [Action]) {
    if let with = animation.with {
      UIView.transitionWithView(with, duration: animation.duration, options: animation.options,
                                animations: {
                                  self.animation.block?(with)
        }, completion: { _ in
          Wave.run(nextActions)
      })
    } else if let from = animation.from, to = animation.to {
      UIView.transitionFromView(from, toView: to, duration: animation.duration, options: animation.options,
                                completion: { _ in
        Wave.run(nextActions)
      })
    }
  }
}
