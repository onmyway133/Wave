//
//  ViewKeyframeChain.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public final class KeyframeChain: Chainable {

    public var actions: [Action] = []
    public let view: UIView

    public init(view: UIView) {
      self.view = view
    }
  }
}

public extension View.KeyframeChain {

  public func duration(interval: NSTimeInterval) -> View.KeyframeChain {
    return configure { (inout action: View.KeyframeAnimation) in
      action.duration = interval
    }
  }

  public func delay(interval: NSTimeInterval) -> View.KeyframeChain {
    return configure { (inout action: View.KeyframeAnimation) in
      action.delay = interval
    }
  }

  public func option(options: UIViewKeyframeAnimationOptions) -> View.KeyframeChain {
    return configure { (inout action: View.KeyframeAnimation) in
      action.options = options
    }
  }

  public func replay(number: UInt) -> View.KeyframeChain {
    return configure { (inout action: View.KeyframeAnimation) in
      action.replay = number
    }
  }
}
