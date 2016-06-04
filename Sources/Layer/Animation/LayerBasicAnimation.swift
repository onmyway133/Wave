//
//  LayerBasicAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public class LayerBasicAnimation: LayerPropertyAnimation {

  public override init() {
    super.init()
    info = CABasicAnimation()
  }

  public func fromValue(value: AnyObject) -> Self {
    (info as? CABasicAnimation)?.fromValue = value
    return self
  }

  public func toValue(value: AnyObject) -> Self {
    (info as? CABasicAnimation)?.toValue = value
    return self
  }

  public func byValue(value: AnyObject) -> Self {
    (info as? CABasicAnimation)?.byValue = value
    return self
  }
}

