//
//  LayerKeyframeChain.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension Layer {

  public final class KeyframeChain: Chainable {

    public var actions: [Action] = []
    public let layer: CALayer

    public init(layer: CALayer) {
      self.layer = layer
    }
  }
}

// MARK: - Configure

extension Layer.KeyframeChain: LayerKeyframeConfigurable {

  public typealias Animation = CAKeyframeAnimation

  public func configureAnimation(block: CAKeyframeAnimation -> Void) -> Layer.KeyframeChain {
    return configure { (action: Layer.KeyframeAction) -> Layer.KeyframeAction in
      block(action.animation)
      return action
    }
  }
}

// MARK: - Animate

extension Layer.KeyframeChain: LayerKeyframeAnimatable {

  public func animate() -> Layer.KeyframeChain {
    var action = Layer.KeyframeAction()
    action.layer = layer

    return link(action).applyDefaults()
  }
}
