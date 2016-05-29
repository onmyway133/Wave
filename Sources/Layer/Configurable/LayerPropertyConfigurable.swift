//
//  LayerPropertyConfigurable.swift
//  Wave
//
//  Created by Khoa Pham on 29/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public protocol LayerPropertyConfigurable: LayerConfigurable {

  associatedtype Animation: CAPropertyAnimation
}

public extension LayerPropertyConfigurable {

  public func keyPath(keyPath: String) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.keyPath = keyPath
    }
  }

  public func additive(additive: Bool) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.additive = additive
    }
  }

  public func cumulative(cumulative: Bool) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.cumulative = cumulative
    }
  }

  public func valueFunction(function: CAValueFunction) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.valueFunction = function
    }
  }
}
