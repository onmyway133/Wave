//
//  Custom.swift
//  Wave
//
//  Created by Khoa Pham on 25/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public struct Custom: Action {

  public var block: Block?

  public init() {

  }

  public func run(nextActions: [Action]) {
    block?()
    Wave.run(nextActions)
  }
}
