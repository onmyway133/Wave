import UIKit

public extension UIView {
  func run(_ action: Action, completion: @escaping Closure = {}) {
    action.animation(self, completion)
  }
}
