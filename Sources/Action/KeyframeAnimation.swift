//
//  KeyframeAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 22/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit
import Construction

public struct KeyframeAnimation: Action, Initable {

  var duration: NSTimeInterval = 0
  var animation: Block?

  public init() {}

  public func run(nextActions: [Action]) {
    UIView.animateKeyframesWithDuration(duration, delay: 0, options: [], animations: {
      self.animation?()
    }, completion: { finished in
      self.next(nextActions)
    })
  }
}

