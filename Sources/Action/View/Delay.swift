//
//  Delay.swift
//  Wave
//
//  Created by Khoa Pham on 22/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {
  
  public struct Delay: Action {

    let interval: NSTimeInterval

    init(interval: NSTimeInterval) {
      self.interval = interval
    }

    public func run(nextActions: [Action]) {
      UIView.animateWithDuration(0, delay: interval, options: [], animations: {

        }, completion: { finished in
          Wave.run(nextActions)
      })
    }
  }
}

