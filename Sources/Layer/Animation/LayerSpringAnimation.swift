//
//  LayerSpringAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

@available(iOS 9, *)
public final class LayerSpringAnimation: LayerBasicAnimation {

  public override init() {
    super.init()
    info = CASpringAnimation()
  }

  public func mass(value: Double) -> Self {
    (info as? CASpringAnimation)?.mass = CGFloat(value)
    return self
  }

  public func stiffness(value: Double) -> Self {
    (info as? CASpringAnimation)?.mass = CGFloat(value)
    return self
  }

  public func damping(value: Double) -> Self {
    (info as? CASpringAnimation)?.mass = CGFloat(value)
    return self
  }

  public func initialVelocity(value: Double) -> Self {
    (info as? CASpringAnimation)?.mass = CGFloat(value)
    return self
  }
}
