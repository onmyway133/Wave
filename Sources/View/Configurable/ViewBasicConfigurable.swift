//
//  ViewBasicConfigurable.swift
//  Wave
//
//  Created by Khoa Pham on 29/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public protocol ViewBasicConfigurable: ViewConfigurable {

  associatedtype Animation: View.BasicAnimation

  func configureAnimation(block: Animation -> Void) -> Self
}

public extension ViewBasicConfigurable {

  public func duration(interval: NSTimeInterval) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.duration = interval
    }
  }

  public func delay(interval: NSTimeInterval) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.delay = interval
    }
  }

  public func replay(number: UInt) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.replay = number
    }
  }

  public func option(options: UIViewAnimationOptions) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.options = options
    }
  }

  public func block(block: Block) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.block = block
    }
  }
}
