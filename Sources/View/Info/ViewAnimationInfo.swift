//
//  ViewAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 28/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

// TODO: Lose the View namespace to please the compiler 😅

public class ViewAnimationInfo {

  var duration: NSTimeInterval = Config.duration
  var delay: NSTimeInterval = Config.delay
  var replay: UInt?

  public init() {

  }
}
