//
//  Wave.swift
//  Wave
//
//  Created by Khoa Pham on 22/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit
import Construction

public typealias Block = () -> Void
public let defaultDuration: NSTimeInterval = 0.25

public extension UIView {

  public var wave: Chain {
    return Chain(view: self)
  }
}
