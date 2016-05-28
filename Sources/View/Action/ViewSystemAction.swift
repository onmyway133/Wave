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

    var options: UIViewAnimationOptions = []
    var views: [UIView] = []
    var animation: UISystemAnimation = .Delete
    var parallelBlock: Block?
  }
}

extension View.SystemAction: Action {

  public func run(nextActions: [Action]) {
    UIView.performSystemAnimation(animation, onViews: views, options: options,
                                  animations:
      {
        self.parallelBlock?()
      }, completion: { _ in
        Wave.run(nextActions)
    })
  }
}
