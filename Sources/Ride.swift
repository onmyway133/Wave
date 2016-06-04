//
//  Ride.swift
//  Wave
//
//  Created by Khoa Pham on 29/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public struct Ride {

  let view: UIView

  public init(view: UIView) {
    self.view = view
  }
}

public extension Ride {

  public func shake() -> Chain<Layer.Action> {
    return
      Chain<Layer.Action>()
      .layer(view.layer)
      .add(LayerKeyframeAnimation()
        .keyPath("position.x")
        .values([0, 15, -15, 15, 0])
        .additive(true)
        .coolConfig()
      )
  }

  public func pop() -> Chain<Layer.Action> {
    return
      Chain<Layer.Action>()
      .layer(view.layer)
      .add(LayerKeyframeAnimation()
        .keyPath("transform.scale")
        .values([0, 0.2, -0.2, 0.2, 0])
        .keyTimes([0, 0.2, 0.4, 0.6, 0.8, 1])
        .additive(true)
        .coolConfig()
      )
  }

  public func morph() -> Chain<Layer.Action> {
    return
      Chain<Layer.Action>()
      .layer(view.layer)
      .add(LayerKeyframeAnimation()
        .keyPath("transform.scale.x")
        .values([1, 1.3, 0.7, 1.3, 1])
        .keyTimes([0, 0.2, 0.4, 0.6, 0.8, 1])
        .coolConfig()
      )
      .add(LayerKeyframeAnimation()
        .keyPath("transform.scale.x")
        .values([1, 1.3, 0.7, 1.3, 1])
        .keyTimes([0, 0.2, 0.4, 0.6, 0.8, 1])
        .coolConfig()
      )
  }

  public func squeeze() -> Chain<Layer.Action> {
    return
      Chain<Layer.Action>()
      .layer(view.layer)
      .add(LayerKeyframeAnimation()
        .keyPath("transform.scale.x")
        .values([1, 1.5, 0.5, 1.5, 1])
        .keyTimes([0, 0.2, 0.4, 0.6, 0.8, 1])
        .coolConfig()
      )
      .add(LayerKeyframeAnimation()
        .keyPath("transform.scale.x")
        .values([1, 0.5, 1, 0.5, 1])
        .keyTimes([0, 0.2, 0.4, 0.6, 0.8, 1])
        .coolConfig()
      )
  }

  public func wobble() -> Chain<Layer.Action> {
    return
      Chain<Layer.Action>()
      .layer(view.layer)
      .add(LayerKeyframeAnimation()
        .keyPath("transform.rotation")
        .values([0, 0.3, -0.3, 0.3, 0])
        .keyTimes([0, 0.2, 0.4, 0.6, 0.8, 1])
        .additive(true)
        .coolConfig()
      )
      .add(LayerKeyframeAnimation()
        .keyPath("position.x")
        .values([0, 30, -30, 30, 0])
        .keyTimes([0, 0.2, 0.4, 0.6, 0.8, 1])
        .additive(true)
        .coolConfig()
      )
  }

  public func swing() -> Chain<Layer.Action> {
    return
      Chain<Layer.Action>()
      .layer(view.layer)
      .add(LayerKeyframeAnimation()
        .keyPath("transform.rotation")
        .values([0, 0.3, -0.3, 0.3, 0])
        .keyTimes([0, 0.2, 0.4, 0.6, 0.8, 1])
        .additive(true)
        .coolConfig()
      )
  }

  public func flipX() -> Chain<Layer.Action> {
    var perspective = CATransform3DIdentity
    perspective.m34 = 1.0 / -500

    return
      Chain<Layer.Action>()
      .layer(view.layer)
      .add(LayerBasicAnimation()
        .keyPath("transform")
        .fromValue(NSValue(CATransform3D: CATransform3DIdentity))
        .toValue(NSValue(CATransform3D: CATransform3DConcat(perspective, CATransform3DMakeRotation(CGFloat(M_PI), 0, 1, 0))))
        .coolConfig()
      )
  }

  public func flipY() -> Chain<Layer.Action> {
    var perspective = CATransform3DIdentity
    perspective.m34 = 1.0 / -500

    return
      Chain<Layer.Action>()
      .layer(view.layer)
      .add(LayerBasicAnimation()
        .keyPath("transform")
        .fromValue(NSValue(CATransform3D: CATransform3DIdentity))
        .toValue(NSValue(CATransform3D: CATransform3DConcat(perspective, CATransform3DMakeRotation(CGFloat(M_PI), 1, 0, 0))))
        .coolConfig()
      )
  }

  public func flash() -> Chain<Layer.Action> {
    return
      Chain<Layer.Action>()
      .layer(view.layer)
      .add(LayerBasicAnimation()
        .fadeOut()
        .repeatCount(2)
        .coolConfig()
      )
  }
}
