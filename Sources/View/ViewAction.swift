//
//  ViewAction.swift
//  Pods
//
//  Created by Khoa Pham on 04/06/16.
//
//

import UIKit

public extension View {

  public final class Action {

    public var view: UIView?

    public init() {
      
    }
  }
}

extension View.Action: Action {

  public func run(nextActions: [Action]) {

  }
}
