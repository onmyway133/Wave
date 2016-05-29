//
//  LayerKeyframeAnimatable.swift
//  Wave
//
//  Created by Khoa Pham on 29/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public protocol LayerKeyframeAnimatable: LayerAnimatable {

}

public extension LayerKeyframeAnimatable where Self: LayerKeyframeConfigurable {

  public func shake() -> Self {
    return animate()
      .keyPath("position.x")
      .values([0, 15, -15, 15, 0])      
  }
}
