//
//  LayerBasicAnimationConfigurable.swift
//  Wave
//
//  Created by Khoa Pham on 29/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public protocol LayerBasicAnimationConfigurable: LayerPropertyAnimationConfigurable {

}

// MARK: - Config

public extension Chain where A: LayerBasicAnimationConfigurable {

  public func fromValue(value: AnyObject) -> Chain {
    return configure { (action: LayerBasicAnimationConfigurable) in
      if let animation = action.animation as? CABasicAnimation {
        animation.fromValue = value
      }
    }
  }

  public func toValue(value: AnyObject) -> Chain {
    return configure { (action: LayerBasicAnimationConfigurable) in
      if let animation = action.animation as? CABasicAnimation {
        animation.toValue = value
      }
    }
  }

  public func byValue(value: AnyObject) -> Chain {
    return configure { (action: LayerBasicAnimationConfigurable) in
      if let animation = action.animation as? CABasicAnimation {
        animation.byValue = value
      }
    }
  }
}

// MARK: - Animate

public extension Chain where A: LayerBasicAnimationConfigurable {

  // MARK: - Move

  public func moveX(value: Double) -> Chain {
    return newAction()
      .keyPath("position.x")
      .toValue(value)
      .defaults()
  }

  public func moveY(value: Double) -> Chain {
    return newAction()
      .keyPath("position.y")
      .toValue(value)
      .defaults()
  }

  public func move(value: CGPoint) -> Chain {
    return newAction()
      .keyPath("position")
      .toValue(NSValue(CGPoint: value))
      .defaults()
  }

  // MARK: - Move

  public func translateX(value: Double) -> Chain {
    return newAction()
      .keyPath("transform.translation.x")
      .toValue(value)
      .defaults()
  }

  public func translateY(value: Double) -> Chain {
    return newAction()
      .keyPath("transform.translation.y")
      .toValue(value)
      .defaults()
  }

  public func translate(value: CGPoint) -> Chain {
    return newAction()
      .keyPath("transform.translation")
      .toValue(NSValue(CGPoint: value))
      .defaults()
  }

  // MARK: - Scale

  public func scaleX(value: Double) -> Chain {
    return newAction()
      .keyPath("transform.scale.x")
      .toValue(value)
      .defaults()
  }

  public func scaleY(value: Double) -> Chain {
    return newAction()
      .keyPath("transform.scale.y")
      .toValue(value)
      .defaults()
  }

  public func scale(value: CGPoint) -> Chain {
    return newAction()
      .keyPath("transform.scale")
      .toValue(NSValue(CGPoint: value))
      .defaults()
  }

  // MARK: - Zoom

  public func zoom(value: Double) -> Chain {
    return scale(CGPoint(x: value, y: value))
  }

  // MARK: - Rotate

  public func rotateX(angle: Double) -> Chain {
    return newAction()
      .keyPath("transform.rotate.x")
      .toValue(angle)
      .defaults()
  }

  public func rotateY(angle: Double) -> Chain {
    return newAction()
      .keyPath("transform.rotate.y")
      .toValue(angle)
      .defaults()
  }

  public func rotateZ(angle: Double) -> Chain {
    return newAction()
      .keyPath("transform.rotate.z")
      .toValue(angle)
      .defaults()
  }


  // MARK: - Fade

  public func fade(visible: Bool) -> Chain {
    return newAction()
      .keyPath("opacity")
      .fromValue(visible ? 0 : 1)
      .toValue(visible ? 1 : 0)
      .defaults()

  }

  public func fadeIn() -> Chain {
    return fade(true)
  }

  public func fadeOut() -> Chain {
    return fade(false)
  }
}

public extension Chain where A: LayerBasicAnimationConfigurable {

  public func flipX() -> Chain {
    var perspective = CATransform3DIdentity
    perspective.m34 = 1.0 / -500

    return newAction()
      .keyPath("transform")
      .fromValue(NSValue(CATransform3D: CATransform3DMakeRotation(0, 0, 0, 0)))
      .toValue(NSValue(CATransform3D: CATransform3DConcat(perspective, CATransform3DMakeRotation(CGFloat(M_PI), 0, 0, 0))))
  }

  public func flipY() -> Chain {
    var perspective = CATransform3DIdentity
    perspective.m34 = 1.0 / -500

    return newAction()
      .keyPath("transform")
      .fromValue(NSValue(CATransform3D: CATransform3DMakeRotation(0, 0, 0, 0)))
      .toValue(NSValue(CATransform3D: CATransform3DConcat(perspective, CATransform3DMakeRotation(CGFloat(M_PI), 1, 0, 0))))
  }

  public func flash() -> Chain {
    return newAction()
      .fadeOut()
      .repeatCount(2)
  }
}
