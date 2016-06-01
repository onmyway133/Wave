//
//  Layer.swift
//  Wave
//
//  Created by Khoa Pham on 27/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public struct Layer {
  
}

public extension Layer {

  public struct CalculationMode {

    public let value: String

    public init(value: String) {
      self.value = value
    }

    public static let Linear = CalculationMode(value: kCAAnimationLinear)
    public static let Discrete = CalculationMode(value: kCAAnimationDiscrete)
    public static let Paced = CalculationMode(value: kCAAnimationPaced)
    public static let Cubic = CalculationMode(value: kCAAnimationCubic)
    public static let CubicPaced = CalculationMode(value: kCAAnimationCubicPaced)
  }

  public struct RotationMode {

    public let value: String

    public init(value: String) {
      self.value = value
    }

    public static let Auto = RotationMode(value: kCAAnimationRotateAuto)
    public static let AutoReverse = RotationMode(value: kCAAnimationRotateAutoReverse)
  }

  public struct FillMode {

    public let value: String

    public init(value: String) {
      self.value = value
    }

    public static let Removed = FillMode(value: kCAFillModeRemoved)
    public static let Forwards = FillMode(value: kCAFillModeForwards)
    public static let Backwards = FillMode(value: kCAFillModeBackwards)
    public static let Both = FillMode(value: kCAFillModeBoth)
  }


  public struct TimingFunction {

    public static let Default = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
    public static let Linear = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
    public static let EaseIn = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
    public static let EaseOut = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
    public static let EaseInEaseOut = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)

    public static let EaseInCubic = CAMediaTimingFunction(controlPoints: 0.55, 0.055, 0.675, 0.19)
  }
}
