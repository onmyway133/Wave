//
//  LayerBasicAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public class LayerBasicAnimation: LayerPropertyAnimation {

  public override init() {
    super.init()
    info = CABasicAnimation()
  }

  public func fromValue(value: AnyObject) -> Self {
    (info as? CABasicAnimation)?.fromValue = value
    return self
  }

  public func toValue(value: AnyObject) -> Self {
    (info as? CABasicAnimation)?.toValue = value
    return self
  }

  public func byValue(value: AnyObject) -> Self {
    (info as? CABasicAnimation)?.byValue = value
    return self
  }
}

public extension LayerBasicAnimation {

  // MARK: - Move

  public func moveX(value: Double) -> Self {
    return
      keyPath("position.x")
      .toValue(value)
  }

  public func moveY(value: Double) -> Self {
    return
      keyPath("position.y")
      .toValue(value)
  }

  public func move(value: CGPoint) -> Self {
    return
      keyPath("position")
      .toValue(NSValue(CGPoint: value))
  }

  // MARK: - Move

  public func translateX(value: Double) -> Self {
    return
      keyPath("transform.translation.x")
      .toValue(value)
  }

  public func translateY(value: Double) -> Self {
    return
      keyPath("transform.translation.y")
      .toValue(value)
  }

  public func translate(value: CGPoint) -> Self {
    return
      keyPath("transform.translation")
      .toValue(NSValue(CGPoint: value))
  }

  // MARK: - Scale

  public func scaleX(value: Double) -> Self {
    return
      keyPath("transform.scale.x")
      .toValue(value)
  }

  public func scaleY(value: Double) -> Self {
    return
      keyPath("transform.scale.y")
      .toValue(value)
  }

  public func scale(value: CGPoint) -> Self {
    return
      keyPath("transform.scale")
      .toValue(NSValue(CGPoint: value))
  }

  // MARK: - Zoom

  public func zoom(value: Double) -> Self {
    return
      scale(CGPoint(x: value, y: value))
  }

  // MARK: - Rotate

  public func rotateX(angle: Double) -> Self {
    return
      keyPath("transform.rotate.x")
      .toValue(angle)
  }

  public func rotateY(angle: Double) -> Self {
    return
      keyPath("transform.rotate.y")
      .toValue(angle)
  }

  public func rotateZ(angle: Double) -> Self {
    return
      keyPath("transform.rotate.z")
      .toValue(angle)
  }

  // MARK: - Fade

  public func fade(visible: Bool) -> Self {
    return
      keyPath("opacity")
      .fromValue(visible ? 0.0 : 1.0)
      .toValue(visible ? 1.0 : 0)
  }

  public func fadeIn() -> Self {
    return
      fade(true)
  }

  public func fadeOut() -> Self {
    return
      fade(false)
  }
}

