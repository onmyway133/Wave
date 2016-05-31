//
//  LayerCompoundAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 29/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension Layer {

  public final class CompoundAnimation: LayerConfigurable {

    public var layer: CALayer?
    public var animations: [CAAnimation] = []

    public init() {

    }
  }
}

extension Layer.CompoundAnimation: Action {

  public func run(nextActions: [Action]) {
    CATransaction.begin()

    CATransaction.setCompletionBlock {
      Wave.run(nextActions)
    }

    animations.forEach {
      self.layer?.addAnimation($0, forKey: "")
    }

    CATransaction.commit()
  }
}

// MARK: - Configure

extension Chain where A: Layer.CompoundAnimation {

  public func add<T: LayerAnimationConfigurable>(chains: [Chain<T>]) -> Chain {
    return configure { (action: Layer.CompoundAnimation) in
      chains.forEach { chain in
        chain.actions.forEach { a in
          if let a = a as? LayerAnimationConfigurable {
            action.animations.append(a.info)
          }
        }
      }
    }
  }

  public func add<T: LayerAnimationConfigurable>(chain: Chain<T>) -> Chain {
    return add([chain])
  }
}

// MARK: - Animate

extension Chain where A: Layer.CompoundAnimation {

  public func morph() -> Chain {
    let chain = Chain<Layer.KeyframeAnimation>()
      .newAction()
      .keyPath("transform.scale.x")
      .values([1, 1.3, 0.7, 1.3, 1])
      .keyTimes([0, 0.2, 0.4, 0.6, 0.8, 1])
      .newAction()
      .keyPath("transform.scale.x")
      .values([1, 1.3, 0.7, 1.3, 1])
      .keyTimes([0, 0.2, 0.4, 0.6, 0.8, 1])

    return add(chain)
  }

  public func squeeze() -> Chain {
    let chain = Chain<Layer.KeyframeAnimation>()
      .newAction()
      .keyPath("transform.scale.x")
      .values([1, 1.5, 0.5, 1.5, 1])
      .keyTimes([0, 0.2, 0.4, 0.6, 0.8, 1])
      .newAction()
      .keyPath("transform.scale.x")
      .values([1, 0.5, 1, 0.5, 1])
      .keyTimes([0, 0.2, 0.4, 0.6, 0.8, 1])

    return add(chain)
  }

  public func wobble() -> Chain {
    let chain = Chain<Layer.KeyframeAnimation>()
      .newAction()
      .keyPath("transform.rotation")
      .values([0, 0.3, -0.3, 0.3, 0])
      .keyTimes([0, 0.2, 0.4, 0.6, 0.8, 1])
      .newAction()
      .keyPath("position.x")
      .values([0, 30, -30, 30, 0])
      .keyTimes([0, 0.2, 0.4, 0.6, 0.8, 1])

    return add(chain)
  }
}
