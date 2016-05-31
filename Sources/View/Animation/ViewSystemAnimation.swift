//
//  ViewSystemAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public final class SystemAnimation: ViewConfigurable {

    let _info = View.SystemAnimationInfo()
    public var view: UIView?

    public var info: View.AnimationInfo {
      return _info
    }

    public init() {

    }
  }
}

extension View.SystemAnimation: Action {

  public func run(nextActions: [Action]) {
    UIView.performSystemAnimation(_info.animation, onViews: _info.views, options: _info.options,
                                  animations:
      {
        self._info.parallelBlock?()
      }, completion: { _ in
        Wave.run(nextActions)
    })
  }
}

extension Chain where A: View.SystemAnimation {

  public func options(options: UIViewAnimationOptions) -> Chain {
    return configure { (animation: View.SystemAnimation) in
      if let info = animation.info as? View.SystemAnimationInfo {
        info.options = options
      }
    }
  }

  public func parallelBlock(block: Block) -> Chain {
    return configure { (animation: View.SystemAnimation) in
      if let info = animation.info as? View.SystemAnimationInfo {
        info.parallelBlock = block
      }
    }
  }
}
