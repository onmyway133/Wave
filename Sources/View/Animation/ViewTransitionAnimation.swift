//
//  ViewTransitionAnimation.swift
//  Wave
//
//  Created by Khoa Pham on 28/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension View {

  public class TransitionAnimation {

    var duration: NSTimeInterval = Wave.defaultDuration
    var options: UIViewAnimationOptions = []
    var from: UIView?
    var to: UIView?
    var with: UIView?
    var block: (UIView -> Void)?

    public required init() {

    }
  }
}
