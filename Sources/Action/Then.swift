//
//  Then.swift
//  Wave
//
//  Created by Khoa Pham on 25/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public struct Then: Action {

  let block: Block

  public init(block: Block) {
    self.block = block
  }

  public func run(nextActions: [Action]) {
    block()
    Wave.run(nextActions)
  }
}
