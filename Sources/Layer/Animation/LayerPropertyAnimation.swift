//
//  LayerPropertyAnimation.swift
//  Pods
//
//  Created by Khoa Pham on 04/06/16.
//
//

import UIKit

public class LayerPropertyAnimation: LayerAnimation {

  public override init() {
    super.init()
    info = CAPropertyAnimation()
  }
}

public extension LayerPropertyAnimation {

  public func keyPath(keyPath: String) -> Self {
    (info as? CAPropertyAnimation)?.keyPath = keyPath
    return self
  }

  public func additive(additive: Bool) -> Self {
    (info as? CAPropertyAnimation)?.additive = additive
    return self
  }

  public func cumulative(cumulative: Bool) -> Self {
    (info as? CAPropertyAnimation)?.cumulative = cumulative
    return self
  }

  public func valueFunction(function: CAValueFunction) -> Self {
    (info as? CAPropertyAnimation)?.valueFunction = function
    return self
  }
}



