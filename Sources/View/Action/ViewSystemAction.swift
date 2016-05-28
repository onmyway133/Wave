//
//  ViewSystemAction.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public struct SystemAction {

    let animation = View.SystemAnimation()
  }
}

extension View.SystemAction: Action {

  public func run(nextActions: [Action]) {
    UIView.performSystemAnimation(animation.animation, onViews: animation.views, options: animation.options,
                                  animations:
      {
        self.animation.parallelBlock?()
      }, completion: { _ in
        Wave.run(nextActions)
    })
  }
}
