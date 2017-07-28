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
}
