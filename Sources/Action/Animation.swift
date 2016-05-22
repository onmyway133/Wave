//
//  Animation.swift
//  Wave
//
//  Created by Khoa Pham on 22/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public struct Animation: Action {

  let duration: NSTimeInterval
  let block: Block

  public init(duration: NSTimeInterval, block: Block) {
    self.duration = duration
    self.block = block
  }

  public func run(nextActions: [Action]) {
    UIView.animateWithDuration(duration, delay: 0, options: [], animations: {
      self.block()
    }, completion: { _ in
      self.next(nextActions)
    })
  }
}


