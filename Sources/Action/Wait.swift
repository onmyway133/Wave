//
//  Wait.swift
//  Wave
//
//  Created by Khoa Pham on 22/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public struct Wait: Action {

  public var interval: NSTimeInterval = 0

  public init() {

  }

  public func run(nextActions: [Action]) {
    // TODO: Prefer to use UIView animation

    let time = dispatch_time(DISPATCH_TIME_NOW, Int64(interval * Double(NSEC_PER_SEC)))
    dispatch_after(time, dispatch_get_main_queue()) {
      Wave.run(nextActions)
    }
  }
}


