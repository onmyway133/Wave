//
//  LayerSpringChain.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension Layer {

  @available(iOS 9, *)
  public final class SpringChain: Chainable {

    public var actions: [Action] = []
    public let layer: CALayer

    public init(layer: CALayer) {
      self.layer = layer
    }
  }
}

// MARK: - Configure

// MARK: - Animate

extension Layer.SpringChain: LayerAnimatable {

  @available(iOS 9, *)
  public typealias Animation = CASpringAnimation
  
  @available(iOS 9, *)
  public func animate(block: CASpringAnimation -> Void) -> Layer.SpringChain {
    var action = Layer.SpringAction()
    action.layer = layer
    block(action.animation)

    return link(action)
  }
}
