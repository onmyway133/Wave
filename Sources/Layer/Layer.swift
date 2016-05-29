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
}
