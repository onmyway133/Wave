//
//  LayerPropertyConfigurable.swift
//  Wave
//
//  Created by Khoa Pham on 29/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public protocol LayerPropertyConfigurable: LayerAnimationConfigurable {

}

// MARK: - Config

public extension Chain where A: LayerPropertyConfigurable  {

  public func keyPath(keyPath: String) -> Chain {
    return configure { (action: LayerAnimationConfigurable) in
      if let animation = action.animation as? CAPropertyAnimation {
        animation.keyPath = keyPath
      }
    }
  }

  public func additive(additive: Bool) -> Chain {
    return configure { (action: LayerAnimationConfigurable) in
      if let animation = action.animation as? CAPropertyAnimation {
        animation.additive = additive
      }
    }
  }

  public func cumulative(cumulative: Bool) -> Chain {
    return configure { (action: LayerAnimationConfigurable) in
      if let animation = action.animation as? CAPropertyAnimation {
        animation.cumulative = cumulative
      }
    }
  }

  public func valueFunction(function: CAValueFunction) -> Chain {
    return configure { (action: LayerAnimationConfigurable) in
      if let animation = action.animation as? CAPropertyAnimation {
        animation.valueFunction = function
      }
    }
  }
}

public extension Chain where A: LayerPropertyConfigurable  {

  public func defaults() -> Chain {
    return duration(Config.duration)
      .timingFunction(Config.timingFunction)
      .additive(true)
  }
}
