//
//  ViewSpringChain.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public final class SpringChain: Chainable {
    
    public var actions: [Action] = []
    public let view: UIView

    public init(view: UIView) {
      self.view = view
    }

  }
}

public extension View.SpringChain {

  public func duration(interval: NSTimeInterval) -> View.SpringChain {
    return configure { (inout action: View.SpringAnimation) in
      action.duration = interval
    }
  }

  public func delay(interval: NSTimeInterval) -> View.SpringChain {
    return configure { (inout action: View.SpringAnimation) in
      action.delay = interval
    }
  }

  public func option(options: UIViewAnimationOptions) -> View.SpringChain {
    return configure { (inout action: View.SpringAnimation) in
      action.options = options
    }
  }

  public func damping(value: CGFloat) -> View.SpringChain {
    return configure { (inout action: View.SpringAnimation) in
      action.damping = value
    }
  }

  public func velocity(value: CGFloat) -> View.SpringChain {
    return configure { (inout action: View.SpringAnimation) in
      action.velocity = value
    }
  }
}
