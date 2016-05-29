//
//  LayerCompoundChain.swift
//  Wave
//
//  Created by Khoa Pham on 29/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension Layer {

  public final class CompoundChain: Chainable {

    public var actions: [Action] = []
    public let layer: CALayer

    public init(layer: CALayer) {
      self.layer = layer
    }
  }
}

// MARK: - Configure

extension Layer.CompoundChain: LayerConfigurable {

  public typealias Animation = CAAnimation

  public func configureAnimation(block: CAAnimation -> Void) -> Layer.CompoundChain {
    return configure { (action: Layer.CompoundAction) -> Layer.CompoundAction in
      action.animations.forEach {
        block($0)
      }

      return action
    }
  }
}

public extension Layer.CompoundChain {

  public func add<T: LayerConfigurable>(chain: T) -> Layer.CompoundChain {
    return self
  }
}

// MARK: - Animate

extension Layer.CompoundChain: LayerAnimatable {

  public func animate() -> Layer.CompoundChain {
    var action = Layer.CompoundAction()
    action.layer = layer

    return link(action)
  }
}
