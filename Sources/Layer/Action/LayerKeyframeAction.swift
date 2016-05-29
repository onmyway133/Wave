//
//  LayerKeyframeAction.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension Layer {

  public struct KeyframeAction {

    var layer: CALayer?
    var animation = CAKeyframeAnimation()
  }
}

extension Layer.KeyframeAction: Action {

  public func run(nextActions: [Action]) {
    CATransaction.begin()

    CATransaction.setCompletionBlock {
      Wave.run(nextActions)
    }

    layer?.addAnimation(animation, forKey: "")

    CATransaction.commit()
  }
}
