//
//  LayerCompoundAction.swift
//  Wave
//
//  Created by Khoa Pham on 29/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension Layer {

  public final class CompoundAction: LayerConfigurable {

    public var layer: CALayer?
    public var animations: [CAAnimation] = []

    public init() {
      
    }
  }
}

extension Layer.CompoundAction: Action {

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

extension Chain where A: Layer.CompoundAction {

  public func add(chains: [Chain]) -> Chain {
    return configure { (action: Layer.CompoundAction) in
      chains.forEach { chain in
        chain.actions.forEach { a in
          if let a = a as? LayerAnimationConfigurable {
            action.animations.append(a.animation)
          }
        }
      }
    }
  }

  public func add(chain: Chain) -> Chain {
    return add([chain])
  }
}

// MARK: - Animate

extension Chain where A: Layer.CompoundAction {

  public func morph() -> Chain {
    return self
  }

  public func squeeze() -> Chain {
    return self
  }

  public func wobble() -> Chain {
    return self
  }
}
