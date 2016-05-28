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

public extension Layer.BasicChain {

  func configure(block: CABasicAnimation -> Void) -> Layer.BasicChain {
    return configure { (action: Layer.BasicAnimation) in
      block(action.animation)
    }
  }

  public func timingFunction(function: CAMediaTimingFunction) -> Layer.BasicChain {
    return configure { (animation: CAAnimation) in
      animation.timingFunction = function
    }
  }

  public func removedOnCompletion(removed: Bool) -> Layer.BasicChain {
    return configure { (animation: CAAnimation) in
      animation.removedOnCompletion = removed
    }
  }

  public func keyPath(keyPath: String) -> Layer.BasicChain {
    return configure { (inout action: Layer.BasicAnimation) in
      action.animation.keyPath = keyPath
    }
  }
}

// MARK: - Animate

extension Layer.BasicChain: LayerAnimatable {

  public func animate(block: CABasicAnimation -> Void) -> Layer.BasicChain {
    var action = Layer.BasicAnimation()
    action.layer = layer
    block(action.animation)

    return link(action)
  }
}
