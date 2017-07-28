import UIKit

public typealias Closure = () -> Void
public typealias Animation = (UIView, @escaping Closure) -> Void

public class Action {
  let animation: Animation

  init(animation: @escaping Animation) {
    self.animation = animation
  }
}
