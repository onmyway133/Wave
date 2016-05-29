//
//  LayerSpringAction.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension Layer {

  @available(iOS 9, *)
  public struct SpringAction {

    var layer: CALayer?
    var animation = CASpringAnimation()
  }
}

extension Layer.SpringAction: Action {

  public func run(nextActions: [Action]) {
    CATransaction.begin()

    CATransaction.setCompletionBlock {
      Wave.run(nextActions)
    }

    layer?.addAnimation(animation, forKey: "")

    CATransaction.commit()
  }
}
