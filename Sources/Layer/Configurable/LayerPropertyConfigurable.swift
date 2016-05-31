//
//  LayerPropertyAnimationConfigurable.swift
//  Wave
//
//  Created by Khoa Pham on 29/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public protocol LayerPropertyAnimationConfigurable: LayerAnimationConfigurable {

}

// MARK: - Config

public extension Chain where A: LayerPropertyAnimationConfigurable  {

  public func keyPath(keyPath: String) -> Chain {
    return configure { (animation: LayerAnimationConfigurable) in
      if let info = animation.info as? CAPropertyAnimation {
        info.keyPath = keyPath
      }
    }
  }

  public func additive(additive: Bool) -> Chain {
    return configure { (animation: LayerAnimationConfigurable) in
      if let info = animation.info as? CAPropertyAnimation {
        info.additive = additive
      }
    }
  }

  public func cumulative(cumulative: Bool) -> Chain {
    return configure { (animation: LayerAnimationConfigurable) in
      if let info = animation.info as? CAPropertyAnimation {
        info.cumulative = cumulative
      }
    }
  }

  public func valueFunction(function: CAValueFunction) -> Chain {
    return configure { (animation: LayerAnimationConfigurable) in
      if let info = animation.info as? CAPropertyAnimation {
        info.valueFunction = function
      }
    }
  }
}

public extension Chain where A: LayerPropertyAnimationConfigurable  {

  public func defaults() -> Chain {
    return duration(Config.duration)
      .timingFunction(Config.timingFunction)
      .additive(true)
  }
}
