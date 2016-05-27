//
//  ViewAnimatable.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public protocol ViewAnimatable: class {
  func animate(block: Block) -> Self
  var view: UIView { get }
}

public extension ViewAnimatable {

  // MARK: - Move

  public func moveX(value: CGFloat) -> Self {
    return move(CGPoint(x: value, y: 0))
  }

  public func moveY(value: CGFloat) -> Self {
    return move(CGPoint(x: 0, y: value))
  }

  public func move(value: CGPoint) -> Self {
    return animate { [weak self] in
      self?.view.transform = CGAffineTransformMakeTranslation(value.x, value.y)
    }
  }

  // MARK: - Scale

  public func scaleX(value: CGFloat) -> Self {
    return move(CGPoint(x: value, y: 0))
  }

  public func scaleY(value: CGFloat) -> Self {
    return move(CGPoint(x: 0, y: value))
  }

  public func scale(value: CGPoint) -> Self {
    return animate { [weak self] in
      self?.view.transform = CGAffineTransformMakeScale(value.x, value.y)
    }
  }

  // MARK: - Zoom

  public func zoom(value: CGFloat) -> Self {
    return scale(CGPoint(x: value, y: value))
  }

  // MARK: - Rotate

  public func rotate(angle: CGFloat) -> Self {
    return animate { [weak self] in
      self?.view.transform = CGAffineTransformMakeRotation(angle)
    }
  }

  // MARK: - Fade

  public func fade(visible: Bool) -> Self {
    return animate { [weak self] in
      self?.view.alpha = visible ? 1 : 0
    }
  }

  public func fadeIn(visible: Bool) -> Self {
    return fade(true)
  }

  public func fadeOut(visible: Bool) -> Self {
    return fade(false)
  }
}
