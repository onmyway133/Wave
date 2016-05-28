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

    var duration: NSTimeInterval = Wave.defaultDuration
    var options: UIViewAnimationOptions = []
    var from: UIView?
    var to: UIView?
    var with: UIView?
    var block: (UIView -> Void)?
  }
}

extension View.TransitionAction: Action {

  public func run(nextActions: [Action]) {
    if let with = with {
      UIView.transitionWithView(with, duration: duration, options: options,
                                animations: {
                                  self.block?(with)
        }, completion: { _ in
          Wave.run(nextActions)
      })
    } else if let from = from, to = to {
      UIView.transitionFromView(from, toView: to, duration: duration, options: options, completion: { _ in
        Wave.run(nextActions)
      })
    }
  }
}
