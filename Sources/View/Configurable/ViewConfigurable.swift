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

public extension Chain where A: ViewConfigurable {

  public func view(view: UIView) -> Chain {
    return configure { (action: ViewConfigurable) in
      action.view = view
    }
  }
}
