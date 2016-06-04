//
//  LayerTransitionAction.swift
//  Wave
//
//  Created by Khoa Pham on 31/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public final class LayerTransitionAnimation: LayerAnimation {

  public override init() {
    super.init()
    info = CATransition()
  }
}

public extension LayerTransitionAnimation {

  public func startProgress(progress: Float) -> Self {
    (info as? CATransition)?.startProgress = progress
    return self
  }

  public func endProgress(progress: Float) -> Self {
    (info as? CATransition)?.endProgress = progress
    return self
  }

  public func type(type: String) -> Self {
    (info as? CATransition)?.type = type
    return self
  }

  public func subtype(subtype: String) -> Self {
    (info as? CATransition)?.subtype = subtype
    return self
  }

  public func filter(filter: AnyObject) -> Self {
    (info as? CATransition)?.filter = filter
    return self
  }
}

