//
//  ViewConfigurable.swift
//  Wave
//
//  Created by Khoa Pham on 28/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public protocol ViewConfigurable: class {

  var view: UIView? { get set }
}

public extension ViewConfigurable {

  public func with(view: UIView) -> Self {
    self.view = view

    return self
  }
}