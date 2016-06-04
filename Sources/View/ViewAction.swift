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
    public var animations: [ViewAnimation] = []

    public init() {
      
    }
  }
}

public extension Chain where A: View.Action {

  public func view(view: UIView) -> Chain {
    return configure { (action: View.Action) in
      action.view = view
    }
  }

  public func add(animation: ViewAnimation) -> Chain {
    return configure { (action: View.Action) in
      // Assign the same view for animation
      animation._view = action.view
      action.animations.append(animation)
    }
  }

  public func configureAnimation<T>(block: T -> Void) -> Chain {
    return configure { (action: View.Action) in
      if let animation = action.animations.last as? T {
        block(animation)
      }
    }
  }
}

extension View.Action: Action {

  public func run(nextActions: [Action]) {

  }
}
