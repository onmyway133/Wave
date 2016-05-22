//
//  Wave.swift
//  Wave
//
//  Created by Khoa Pham on 22/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public typealias Block = () -> Void

public func run(actions: [Action]) {
  if let action = actions.first {
    action.run(Array(actions.dropFirst()))
  }
}
