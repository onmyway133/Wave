//
//  LayerCompoundAction.swift
//  Wave
//
//  Created by Khoa Pham on 29/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension Layer {

  public struct CompoundAction {

    var layer: CALayer?
    var animations: [CAAnimation] = []
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
