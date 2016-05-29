//
//  LayerBasicChain.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension Layer {

  public final class BasicChain: Chainable {

    public var actions: [Action] = []
    public let layer: CALayer

    public init(layer: CALayer) {
      self.layer = layer
    }
  }
}

// MARK: - Configure

extension Layer.BasicChain: LayerBasicConfigurable {

  public typealias Animation = CABasicAnimation

  public func configureAnimation(block: CABasicAnimation -> Void) -> Layer.BasicChain {
    return configure { (action: Layer.BasicAction) -> Layer.BasicAction in
      block(action.animation)
      return action
    }
  }
}

// MARK: - Animate

extension Layer.BasicChain: LayerBasicAnimatable {

  public func animate() -> Layer.BasicChain {
    var action = Layer.BasicAction()
    action.layer = layer

    return link(action).applyDefaults()
  }
}
