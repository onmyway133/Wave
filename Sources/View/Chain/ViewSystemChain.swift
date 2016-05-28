//
//  ViewSystemChain.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public final class SystemChain: Chainable {

    public var actions: [Action] = []
    public let views: [UIView]

    public init(views: [UIView]) {
      self.views = views
    }
  }
}

public extension View.SystemChain {

  public func option(options: UIViewAnimationOptions) -> View.SystemChain {
    return configure { (inout action: View.SystemAnimation) in
      action.options = options
    }
  }

  public func parallelBlock(block: Block) -> View.SystemChain {
    return configure { (inout action: View.SystemAnimation) in
      action.parallelBlock = block
    }
  }
}

public extension View.SystemChain {

  public func animate() -> View.SystemChain {
    var action = View.SystemAnimation()
    action.views = views

    return link(action)
  }
}
