//
//  LayerSpringConfigurable.swift
//  Wave
//
//  Created by Khoa Pham on 30/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public protocol LayerSpringConfigurable: LayerBasicConfigurable {

}

// MARK: - Config

public extension Chain where A: LayerSpringConfigurable {

  public func mass(value: Double) -> Chain {
    return configure { (action: LayerSpringConfigurable) in
      if let animation = action.animation as? CASpringAnimation {
        animation.mass = CGFloat(value)
      }
    }
  }

  public func stiffness(value: Double) -> Chain {
    return configure { (action: LayerSpringConfigurable) in
      if let animation = action.animation as? CASpringAnimation {
        animation.mass = CGFloat(value)
      }
    }
  }

  public func damping(value: Double) -> Chain {
    return configure { (action: LayerSpringConfigurable) in
      if let animation = action.animation as? CASpringAnimation {
        animation.mass = CGFloat(value)
      }
    }
  }

  public func initialVelocity(value: Double) -> Chain {
    return configure { (action: LayerSpringConfigurable) in
      if let animation = action.animation as? CASpringAnimation {
        animation.mass = CGFloat(value)
      }
    }
  }
}
