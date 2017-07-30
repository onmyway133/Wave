import UIKit

public extension Action {
  public static func layer(animationMaker: @escaping () -> CAAnimation) -> Action {
    return Action(animation: { view, completion in
      CATransaction.begin()
      let animation = animationMaker()

      // Callback function
      CATransaction.setCompletionBlock {
        completion()
      }

      // Do the actual animation and commit the transaction
      view.layer.add(animation, forKey: "")
      CATransaction.commit()
    })
  }

  public static func flipX() -> Action {
    return .layer(animationMaker: {
      var perspective = CATransform3DIdentity
      perspective.m34 = 1.0 / -500

      CATransaction.begin()
      let animation = CABasicAnimation(keyPath: "transform")
      animation.duration = 0.25
      animation.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
      animation.toValue = NSValue(caTransform3D:
        CATransform3DConcat(perspective, CATransform3DMakeRotation(CGFloat.pi, 0, 1, 0)))
      animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)

      return animation
    })
  }

  public static func flipY() -> Action {
    return .layer(animationMaker: {
      var perspective = CATransform3DIdentity
      perspective.m34 = 1.0 / -500

      CATransaction.begin()
      let animation = CABasicAnimation(keyPath: "transform")
      animation.duration = 0.25
      animation.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
      animation.toValue = NSValue(caTransform3D:
        CATransform3DConcat(perspective, CATransform3DMakeRotation(CGFloat.pi, 1, 0, 0)))
      animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)

      return animation
    })
  }

  public static func swing() -> Action {
    return .layer(animationMaker: {
      let animation = CAKeyframeAnimation(keyPath: "transform.rotation")
      animation.values = [0, 0.3, -0.3, 0.3, 0]
      animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
      animation.isAdditive = true

      return animation
    })
  }

  public static func pop() -> Action {
    return .layer(animationMaker: {
      let animation = CAKeyframeAnimation(keyPath: "transform.scale")
      animation.values = [0, 0.2, -0.2, 0.2, 0]
      animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
      animation.isAdditive = true

      return animation
    })
  }

  public static func wobble() -> Action {
    let rotation = Action.layer(animationMaker: {
      let animation = CAKeyframeAnimation(keyPath: "transform.rotation")
      animation.values = [0, 0.3, -0.3, 0.3, 0]
      animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
      animation.isAdditive = true

      return animation
    })

    let position = Action.layer(animationMaker: {
      let animation = CAKeyframeAnimation(keyPath: "position.x")
      animation.values = [0, 30, -30, 30, 0]
      animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
      animation.isAdditive = true

      return animation
    })

    return .parallel([
      rotation,
      position
    ])
  }

  public static func squeeze() -> Action {
    let scale1 = Action.layer(animationMaker: {
      let animation = CAKeyframeAnimation(keyPath: "transform.scale.x")
      animation.values = [1, 1.5, 0.5, 1.5, 1]
      animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]

      return animation
    })

    let scale2 = Action.layer(animationMaker: {
      let animation = CAKeyframeAnimation(keyPath: "transform.scale.x")
      animation.values = [1, 0.5, 1, 0.5, 1]
      animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]

      return animation
    })

    return .parallel([
      scale1,
      scale2
    ])
  }

  public static func morph() -> Action {
    let scale1 = Action.layer(animationMaker: {
      let animation = CAKeyframeAnimation(keyPath: "transform.scale.x")
      animation.values = [1, 1.3, 0.7, 1.3, 1]
      animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]

      return animation
    })

    let scale2 = Action.layer(animationMaker: {
      let animation = CAKeyframeAnimation(keyPath: "transform.scale.x")
      animation.values = [1, 1.3, 0.7, 1.3, 1]
      animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]

      return animation
    })

    return .parallel([
      scale1,
      scale2
    ])
  }
}
