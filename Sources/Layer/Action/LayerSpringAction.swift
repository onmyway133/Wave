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
  public final class SpringAction: LayerSpringAnimationConfigurable {

    let _animation = CASpringAnimation()
    public var layer: CALayer?

    public var animation: CAAnimation {
      return _animation
    }

    public init() {
      
    }
  }
}

extension Layer.SpringAction: Action {

  public func run(nextActions: [Action]) {
    CATransaction.begin()

    CATransaction.setCompletionBlock {
      Wave.run(nextActions)
    }

    layer?.addAnimation(_animation, forKey: "")

    CATransaction.commit()
  }
}
