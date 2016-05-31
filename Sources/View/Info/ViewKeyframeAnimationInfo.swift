//
//  ViewKeyframeAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 28/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public class KeyframeAnimationInfo: AnimationInfo {

    var options: UIViewKeyframeAnimationOptions = []
    var block: Block?
    var items: [View.KeyframeAnimationInfoItem] = []

    public override init() {

    }
  }

  public class KeyframeAnimationInfoItem {

    var startTime: NSTimeInterval = 0
    var duration: NSTimeInterval = 0
    let block: Block

    public init(block: Block) {
      self.block = block
    }
  }
}
