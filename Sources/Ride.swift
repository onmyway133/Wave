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

  public func shake() {
    Chain<Layer.KeyframeAnimation>()
      .layer(view.layer)
      .shake()
      .run()
  }

  public func pop() {
    Chain<Layer.KeyframeAnimation>()
      .layer(view.layer)
      .pop()
      .run()
  }

  public func morph() {
    Chain<Layer.CompoundAnimation>()
      .layer(view.layer)
      .morph()
      .run()
  }

  public func squeeze() {
    Chain<Layer.CompoundAnimation>()
      .layer(view.layer)
      .squeeze()
      .run()
  }

  public func wobble() {
    Chain<Layer.CompoundAnimation>()
      .layer(view.layer)
      .wobble()
      .run()
  }

  public func swing() {
    Chain<Layer.KeyframeAnimation>()
      .layer(view.layer)
      .swing()
      .run()
  }

  public func flipX() {
    Chain<Layer.BasicAnimation>()
      .layer(view.layer)
      .flipX()
      .run()
  }

  public func flipY() {
    Chain<Layer.BasicAnimation>()
      .layer(view.layer)
      .flipY()
      .run()
  }

  public func flash() {
    Chain<Layer.BasicAnimation>()
      .layer(view.layer)
      .flash()
      .run()
  }
}
