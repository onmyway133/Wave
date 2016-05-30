//
//  LayerCompoundAction.swift
//  Wave
//
//  Created by Khoa Pham on 29/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension Layer {

  public final class CompoundAction: Action {

    public var layer: CALayer?
    public var animations: [CAAnimation] = []

    public init() {
      
    }
  }
}

extension Layer.CompoundAction {

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

extension Chain where A: Layer.CompoundAction {

  public func add(chains: [Chain]) -> Chain {
    return configure { (action: Layer.CompoundAction) in
      chains.forEach { chain in
        chain.actions.forEach { a in
          if let a = a as? LayerConfigurable {
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
