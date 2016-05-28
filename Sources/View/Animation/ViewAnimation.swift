//
//  ViewAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 28/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public class Animation {

    var duration: NSTimeInterval = Wave.defaultDuration
    var delay: NSTimeInterval = Wave.defaultDelay
    var replay: UInt?

    public init() {
      
    }
  }
}

