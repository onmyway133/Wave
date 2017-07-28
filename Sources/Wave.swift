import UIKit

public extension UIView {
  func wave(action: Action, completion: @escaping Closure = {}) {
    action.animation(self, completion)
  }
}
