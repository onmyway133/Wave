//
//  SpringAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 22/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit
import Construction

public struct SpringAnimation: Action, Initable {

  var duration: NSTimeInterval = 0
  var damping: CGFloat = 0
  var velocity: CGFloat = 0
  var animation: Block?

  public init() {}

  public func run(nextActions: [Action]) {
    UIView.animateWithDuration(duration, delay: 0, usingSpringWithDamping: damping,
                               initialSpringVelocity: velocity, options: [], animations: {
                                self.animation?()
    }, completion: { finished in
      self.next(nextActions)
    })
  }
}

