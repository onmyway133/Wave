import UIKit

// MARK: - Typealias

public typealias Closure = () -> Void

public extension UIView {
  func wave(_ action: Action) {
    action.closure()
  }
}
