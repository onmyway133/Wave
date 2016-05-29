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
    public var view: UIView?

    public init() {

    }
  }
}

// MARK: - Configure

extension View.BasicChain: ViewBasicConfigurable {

  public typealias Animation = View.BasicAnimation

  public func configureAnimation(block: View.BasicAnimation -> Void) -> View.BasicChain {
    return configure { (action: View.BasicAction) -> View.BasicAction in
      block(action.animation)
      return action
    }
  }
}

// MARK: - Animate

extension View.BasicChain: ViewBasicAnimatable {

  public func animate(block: Block) -> View.BasicChain {
    let action = View.BasicAction()
    action.animation.block = block

    return link(action)
  }
}
