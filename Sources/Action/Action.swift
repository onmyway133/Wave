//
//  Action.swift
//  Wave
//
//  Created by Khoa Pham on 22/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public protocol Action {
  
  func run(nextActions: [Action])
}
