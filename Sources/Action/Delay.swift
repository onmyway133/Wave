//
//  Delay.swift
//  Wave
//
//  Created by Khoa Pham on 22/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public struct Delay: Action {

  let interval: NSTimeInterval

  public init(interval: NSTimeInterval) {
    self.interval = interval
  }

  public func run(nextActions: [Action]) {
    UIView.animateWithDuration(0, delay: interval, options: [], animations: {

    }, completion: { _ in
      self.next(nextActions)
    })
  }
}


