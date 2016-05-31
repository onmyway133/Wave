//
//  ViewBasicAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public final class BasicAnimation: ViewConfigurable, ViewBasicAnimationConfigurable {

    let _info = View.BasicAnimationInfo()
    public var view: UIView?

    public var info: View.AnimationInfo {
      return _info
    }

    public init() {

    }
  }
}

extension View.BasicAnimation: Action {

  public func run(nextActions: [Action]) {
    UIView.animateWithDuration(info.duration, delay: _info.delay, options: _info.options,
                               animations:
      {
        if let replay = self.info.replay {
          UIView.setAnimationRepeatCount(Float(replay))
        }

        self._info.block?()
      }, completion: { _ in
        Wave.run(nextActions)
    })
  }
}
