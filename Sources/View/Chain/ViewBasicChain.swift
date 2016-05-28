//
//  ViewBasicChain.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public final class BasicChain: Chainable {

    public var actions: [Action] = []
    public let view: UIView

    public init(view: UIView) {
      self.view = view
    }
  }
}

// MARK: - Configure

public extension View.BasicChain {

  public func duration(interval: NSTimeInterval) -> View.BasicChain {
    return configure { (inout action: View.BasicAction) in
      action.duration = interval
    }
  }

  public func delay(interval: NSTimeInterval) -> View.BasicChain {
    return configure { (inout action: View.BasicAction) in
      action.delay = interval
    }
  }

  public func option(options: UIViewAnimationOptions) -> View.BasicChain {
    return configure { (inout action: View.BasicAction) in
      action.options = options
    }
  }

  public func replay(number: UInt) -> View.BasicChain {
    return configure { (inout action: View.BasicAction) in
      action.replay = number
    }
  }
}

// MARK: - Animate

extension View.BasicChain: ViewAnimatable {

  public func animate(block: Block) -> View.BasicChain {
    var action = View.BasicAction()
    action.block = block

    return link(action)
  }
}
