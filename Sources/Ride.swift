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
    Chain<Layer.KeyframeAction>()
      .layer(view.layer)
      .shake()
      .run()
  }

  public func pop() {
    Chain<Layer.KeyframeAction>()
      .layer(view.layer)
      .pop()
      .run()
  }

  public func morph() {
    Chain<Layer.KeyframeAction>()
      .layer(view.layer)
      .morph()
      .run()
  }

  public func squeeze() {
    Chain<Layer.KeyframeAction>()
      .layer(view.layer)
      .squeeze()
      .run()
  }

  public func wobble() {
    Chain<Layer.KeyframeAction>()
      .layer(view.layer)
      .wobble()
      .run()
  }

  public func swing() {
    Chain<Layer.KeyframeAction>()
      .layer(view.layer)
      .swing()
      .run()
  }

  public func flipX() {
    Chain<Layer.BasicAction>()
      .layer(view.layer)
      .flipX()
      .run()
  }

  public func flipY() {
    Chain<Layer.BasicAction>()
      .layer(view.layer)
      .flipY()
      .run()
  }

  public func flash() {
    Chain<Layer.BasicAction>()
      .layer(view.layer)
      .flash()
      .run()
  }
}
