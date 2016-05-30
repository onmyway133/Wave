//
//  LayerConfigurable.swift
//  Wave
//
//  Created by Khoa Pham on 28/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public protocol LayerConfigurable: class {

  var layer: CALayer? { get set }
}

// MARK: - Config

public extension Chain where A: LayerConfigurable {

  public func layer(layer: CALayer) -> Chain {
    return configure { (action: LayerConfigurable) in
      action.layer = layer
    }
  }
}
