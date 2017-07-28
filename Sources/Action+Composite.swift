import UIKit

public extension Action {
  public static func sequence(actions: [Action]) -> Action {
    func loop(view: UIView, actions: [Action], completion: @escaping Closure) {
      guard let first = actions.first else {
        completion()
        return
      }

      var removedFirstActions = actions
      _ = removedFirstActions.removeFirst()
      first.animation(view, {
        loop(view: view, actions: removedFirstActions, completion: completion)
      })
    }

    return Action(animation: { view, completion in
      loop(view: view, actions: actions, completion: completion)
    })
  }

  public static func parallel(actions: [Action]) -> Action {
    return Action(animation: { view, completion in
      var actions = actions
      let first = actions.removeFirst()
      first.animation(view, completion)
      actions.forEach { action in
        action.animation(view, {})
      }
    })
  }
}
