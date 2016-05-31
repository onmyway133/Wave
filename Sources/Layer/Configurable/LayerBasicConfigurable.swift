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
    return configure { (animation: LayerBasicAnimationConfigurable) in
      if let info = animation.info as? CABasicAnimation {
        info.fromValue = value
      }
    }
  }

  public func toValue(value: AnyObject) -> Chain {
    return configure { (animation: LayerBasicAnimationConfigurable) in
      if let info = animation.info as? CABasicAnimation {
        info.toValue = value
      }
    }
  }

  public func byValue(value: AnyObject) -> Chain {
    return configure { (animation: LayerBasicAnimationConfigurable) in
      if let info = animation.info as? CABasicAnimation {
        info.byValue = value
      }
    }
  }
}

// MARK: - Animate

public extension Chain where A: LayerBasicAnimationConfigurable {

  // MARK: - Move

  public func moveX(value: Double) -> Chain {
    return
      keyPath("position.x")
      .toValue(value)
  }

  public func moveY(value: Double) -> Chain {
    return
      keyPath("position.y")
      .toValue(value)
  }

  public func move(value: CGPoint) -> Chain {
    return
      keyPath("position")
      .toValue(NSValue(CGPoint: value))
  }

  // MARK: - Move

  public func translateX(value: Double) -> Chain {
    return
      keyPath("transform.translation.x")
      .toValue(value)
  }

  public func translateY(value: Double) -> Chain {
    return
      keyPath("transform.translation.y")
      .toValue(value)
  }

  public func translate(value: CGPoint) -> Chain {
    return
      keyPath("transform.translation")
      .toValue(NSValue(CGPoint: value))
  }

  // MARK: - Scale

  public func scaleX(value: Double) -> Chain {
    return
      keyPath("transform.scale.x")
      .toValue(value)
  }

  public func scaleY(value: Double) -> Chain {
    return
      keyPath("transform.scale.y")
      .toValue(value)
  }

  public func scale(value: CGPoint) -> Chain {
    return
      keyPath("transform.scale")
      .toValue(NSValue(CGPoint: value))
  }

  // MARK: - Zoom

  public func zoom(value: Double) -> Chain {
    return scale(CGPoint(x: value, y: value))
  }

  // MARK: - Rotate

  public func rotateX(angle: Double) -> Chain {
    return
      keyPath("transform.rotate.x")
      .toValue(angle)
  }

  public func rotateY(angle: Double) -> Chain {
    return
      keyPath("transform.rotate.y")
      .toValue(angle)
  }

  public func rotateZ(angle: Double) -> Chain {
    return
      keyPath("transform.rotate.z")
      .toValue(angle)
  }


  // MARK: - Fade

  public func fade(visible: Bool) -> Chain {
    return
      keyPath("opacity")
      .fromValue(visible ? 0 : 1)
      .toValue(visible ? 1 : 0)
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

    return
      keyPath("transform")
      .fromValue(NSValue(CATransform3D: CATransform3DMakeRotation(0, 0, 0, 0)))
      .toValue(NSValue(CATransform3D: CATransform3DConcat(perspective, CATransform3DMakeRotation(CGFloat(M_PI), 0, 0, 0))))
  }

  public func flipY() -> Chain {
    var perspective = CATransform3DIdentity
    perspective.m34 = 1.0 / -500

    return
      keyPath("transform")
      .fromValue(NSValue(CATransform3D: CATransform3DMakeRotation(0, 0, 0, 0)))
      .toValue(NSValue(CATransform3D: CATransform3DConcat(perspective, CATransform3DMakeRotation(CGFloat(M_PI), 1, 0, 0))))
  }

  public func flash() -> Chain {
    return
      fadeOut()
      .repeatCount(2)
  }
}
