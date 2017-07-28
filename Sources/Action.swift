import UIKit

public class Action {
  let closure: Closure

  init(closure: @escaping Closure) {
    self.closure = closure
  }
}
