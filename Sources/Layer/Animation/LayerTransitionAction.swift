//
//  LayerTransitionAction.swift
//  Wave
//
//  Created by Khoa Pham on 31/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension Layer {

  public final class TransitionAnimation: LayerConfigurable, LayerAnimationConfigurable {

    let _info = CATransition()
    public var layer: CALayer?

    public var info: CAAnimation {
      return _info
    }

    public init() {

    }
  }
}

extension Layer.TransitionAnimation: Action {

  public func run(nextActions: [Action]) {
    CATransaction.begin()

    CATransaction.setCompletionBlock {
      Wave.run(nextActions)
    }

    layer?.addAnimation(_info, forKey: "")

    CATransaction.commit()
  }
}

// MARK: - Configure

extension Chain where A: Layer.TransitionAnimation {

  public func startProgress(progress: Float) -> Chain {
    return configure { (animation: Layer.TransitionAnimation) in
      if let info = animation.info as? CATransition {
        info.startProgress = progress
      }
    }
  }

  public func endProgress(progress: Float) -> Chain {
    return configure { (animation: Layer.TransitionAnimation) in
      if let info = animation.info as? CATransition {
        info.endProgress = progress
      }
    }
  }

  public func type(type: String) -> Chain {
    return configure { (animation: Layer.TransitionAnimation) in
      if let info = animation.info as? CATransition {
        info.type = type
      }
    }
  }

  public func subtype(subtype: String) -> Chain {
    return configure { (animation: Layer.TransitionAnimation) in
      if let info = animation.info as? CATransition {
        info.subtype = subtype
      }
    }
  }

  public func filter(filter: AnyObject) -> Chain {
    return configure { (animation: Layer.TransitionAnimation) in
      if let info = animation.info as? CATransition {
        info.filter = filter
      }
    }
  }
}
