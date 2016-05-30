//
//  LayerBasicConfigurable.swift
//  Wave
//
//  Created by Khoa Pham on 29/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public protocol LayerBasicConfigurable: LayerPropertyConfigurable {

}

// MARK: - Config

public extension Chain where A: LayerBasicConfigurable {

  public func fromValue(value: AnyObject) -> Chain {
    return configure { (action: LayerBasicConfigurable) in
      if let animation = action.animation as? CABasicAnimation {
        animation.fromValue = value
      }
    }
  }

  public func toValue(value: AnyObject) -> Chain {
    return configure { (action: LayerBasicConfigurable) in
      if let animation = action.animation as? CABasicAnimation {
        animation.toValue = value
      }
    }
  }

  public func byValue(value: AnyObject) -> Chain {
    return configure { (action: LayerBasicConfigurable) in
      if let animation = action.animation as? CABasicAnimation {
        animation.byValue = value
      }
    }
  }
}

// MARK: - Animate

public extension Chain where A: LayerBasicConfigurable {

  // MARK: - Move

  public func moveX(value: Double) -> Chain {
    return animate()
      .keyPath("position.x")
      .toValue(value)
      .defaults()
  }

  public func moveY(value: Double) -> Chain {
    return animate()
      .keyPath("position.y")
      .toValue(value)
      .defaults()
  }

  public func move(value: CGPoint) -> Chain {
    return animate()
      .keyPath("position")
      .toValue(NSValue(CGPoint: value))
      .defaults()
  }

  // MARK: - Move

  public func translateX(value: Double) -> Chain {
    return animate()
      .keyPath("transform.translation.x")
      .toValue(value)
      .defaults()
  }

  public func translateY(value: Double) -> Chain {
    return animate()
      .keyPath("transform.translation.y")
      .toValue(value)
      .defaults()
  }

  public func translate(value: CGPoint) -> Chain {
    return animate()
      .keyPath("transform.translation")
      .toValue(NSValue(CGPoint: value))
      .defaults()
  }

  // MARK: - Scale

  public func scaleX(value: Double) -> Chain {
    return animate()
      .keyPath("transform.scale.x")
      .toValue(value)
      .defaults()
  }

  public func scaleY(value: Double) -> Chain {
    return animate()
      .keyPath("transform.scale.y")
      .toValue(value)
      .defaults()
  }

  public func scale(value: CGPoint) -> Chain {
    return animate()
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
    return animate()
      .keyPath("transform.rotate.x")
      .toValue(angle)
      .defaults()
  }

  public func rotateY(angle: Double) -> Chain {
    return animate()
      .keyPath("transform.rotate.y")
      .toValue(angle)
      .defaults()
  }

  public func rotateZ(angle: Double) -> Chain {
    return animate()
      .keyPath("transform.rotate.z")
      .toValue(angle)
      .defaults()
  }


  // MARK: - Fade

  public func fade(visible: Bool) -> Chain {
    return animate()
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

public extension Chain where A: LayerBasicConfigurable {

  public func flipX() -> Chain {
    return self
  }

  public func flipY() -> Chain {
    return self
  }

  public func flash() -> Chain {
    return self
  }
}
