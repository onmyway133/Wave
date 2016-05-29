//
//  LayerBasicConfigurable.swift
//  Wave
//
//  Created by Khoa Pham on 29/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public protocol LayerBasicConfigurable: LayerPropertyConfigurable {

  associatedtype Animation: CABasicAnimation
}

public extension LayerBasicConfigurable {

  public func fromValue(value: AnyObject) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.fromValue = value
      animation.duration = 1
    }
  }

  public func toValue(value: AnyObject) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.toValue = value
    }
  }

  public func byValue(value: AnyObject) -> Self {
    return configureAnimation { (animation: Animation) in
      animation.byValue = value
    }
  }
}
