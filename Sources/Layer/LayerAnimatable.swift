//
//  LayerAnimatable.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public protocol LayerAnimatable: class {

  func animate(block: inout CABasicAnimation -> Void) -> Self
}

public extension LayerAnimatable {

  // MARK: - Move

  public func moveX(value: Double) -> Self {
    return move(CGPoint(x: value, y: 0))
  }

  public func moveY(value: Double) -> Self {
    return move(CGPoint(x: 0, y: value))
  }

  public func move(value: CGPoint) -> Self {
    return animate { animation in
      animation.keyPath = "position.x"
    }
  }
}
