//
//  ViewKeyframeAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 28/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public class KeyframeAnimation: View.Animation {

    var options: UIViewKeyframeAnimationOptions = []
    var block: Block?

    public override init() {

    }
  }
}
