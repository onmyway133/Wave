//
//  LayerSpringAnimationConfigurable.swift
//  Wave
//
//  Created by Khoa Pham on 30/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public protocol LayerSpringAnimationConfigurable: LayerBasicAnimationConfigurable {

}

// MARK: - Config

public extension Chain where A: LayerSpringAnimationConfigurable {

  public func mass(value: Double) -> Chain {
    return configure { (animation: LayerSpringAnimationConfigurable) in
      if let info = animation.info as? CASpringAnimation {
        info.mass = CGFloat(value)
      }
    }
  }

  public func stiffness(value: Double) -> Chain {
    return configure { (animation: LayerSpringAnimationConfigurable) in
      if let info = animation.info as? CASpringAnimation {
        info.mass = CGFloat(value)
      }
    }
  }

  public func damping(value: Double) -> Chain {
    return configure { (animation: LayerSpringAnimationConfigurable) in
      if let info = animation.info as? CASpringAnimation {
        info.mass = CGFloat(value)
      }
    }
  }

  public func initialVelocity(value: Double) -> Chain {
    return configure { (animation: LayerSpringAnimationConfigurable) in
      if let info = animation.info as? CASpringAnimation {
        info.mass = CGFloat(value)
      }
    }
  }
}
