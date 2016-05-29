//
//  LayerBasicAnimatable.swift
//  Wave
//
//  Created by Khoa Pham on 29/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public protocol LayerBasicAnimatable: LayerAnimatable {

}

public extension LayerBasicAnimatable where Self: LayerBasicConfigurable {

  // MARK: - Move

  public func moveX(value: Double) -> Self {
    return animate()
      .keyPath("position.x")
      .toValue(value)
  }

  public func moveY(value: Double) -> Self {
    return animate()
      .keyPath("position.y")
      .toValue(value)
  }

  public func move(value: CGPoint) -> Self {
    return animate()
      .keyPath("position")
      .toValue(NSValue(CGPoint: value))
  }

  // MARK: - Move

  public func translateX(value: Double) -> Self {
    return animate()
      .keyPath("transform.translation.x")
      .toValue(value)
      .applyDefaults()
  }

  public func translateY(value: Double) -> Self {
    return animate()
      .keyPath("transform.translation.y")
      .toValue(value)
  }

  public func translate(value: CGPoint) -> Self {
    return animate()
      .keyPath("transform.translation")
      .toValue(NSValue(CGPoint: value))
  }

  // MARK: - Scale

  public func scaleX(value: Double) -> Self {
    return animate()
      .keyPath("transform.scale.x")
      .toValue(value)
  }

  public func scaleY(value: Double) -> Self {
    return animate()
      .keyPath("transform.scale.y")
      .toValue(value)
  }

  public func scale(value: CGPoint) -> Self {
    return animate()
      .keyPath("transform.scale")
      .toValue(NSValue(CGPoint: value))
  }

  // MARK: - Zoom

  public func zoom(value: Double) -> Self {
    return scale(CGPoint(x: value, y: value))
  }

  // MARK: - Rotate

  public func rotateX(angle: Double) -> Self {
    return animate()
      .keyPath("transform.rotate.x")
      .toValue(angle)
  }

  public func rotateY(angle: Double) -> Self {
    return animate()
      .keyPath("transform.rotate.y")
      .toValue(angle)
  }

  public func rotateZ(angle: Double) -> Self {
    return animate()
      .keyPath("transform.rotate.z")
      .toValue(angle)
      .applyDefaults()
  }


  // MARK: - Fade

  public func fade(visible: Bool) -> Self {
    return animate()
      .keyPath("opacity")
      .fromValue(visible ? 0 : 1)
      .toValue(visible ? 1 : 0)
      .applyDefaults()
      
  }

  public func fadeIn(visible: Bool) -> Self {
    return fade(true)
  }

  public func fadeOut(visible: Bool) -> Self {
    return fade(false)
  }
}

public extension LayerBasicAnimatable where Self: LayerBasicConfigurable {

  public func flipX() -> Self {
    return self
  }

  public func flipY() -> Self {
    return self
  }
}
