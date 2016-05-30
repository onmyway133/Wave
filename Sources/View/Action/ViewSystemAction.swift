//
//  ViewSystemAction.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public final class SystemAction: ViewConfigurable {

    let _animation = View.SystemAnimation()
    public var view: UIView?

    public var animation: View.Animation {
      return _animation
    }

    public init() {

    }
  }
}

extension View.SystemAction: Action {

  public func run(nextActions: [Action]) {
    UIView.performSystemAnimation(_animation.animation, onViews: _animation.views, options: _animation.options,
                                  animations:
      {
        self._animation.parallelBlock?()
      }, completion: { _ in
        Wave.run(nextActions)
    })
  }
}

extension Chain where A: View.SystemAction {

  public func options(options: UIViewAnimationOptions) -> Chain {
    return configure { (action: View.SystemAction) in
      if let animation = action.animation as? View.SystemAnimation {
        animation.options = options
      }
    }
  }

  public func parallelBlock(block: Block) -> Chain {
    return configure { (action: View.SystemAction) in
      if let animation = action.animation as? View.SystemAnimation {
        animation.parallelBlock = block
      }
    }
  }
}
