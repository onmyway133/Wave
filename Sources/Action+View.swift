import UIKit

public extension Action {
  public static func moveX(_ offset: CGFloat) -> Action {
    return Action(animation: { view, completion in
      UIView.animate(withDuration: 0.25, animations: {
        view.frame.origin.x += offset
      }, completion: { _ in
        completion()
      })
    })
  }

  public static func shake() -> Action {
    return Action(animation: { view, completion in
      view.transform = CGAffineTransform(translationX: 20, y: 0)
      UIView.animate(withDuration: 0.4, delay: 0,
                     usingSpringWithDamping: 0.2,
                     initialSpringVelocity: 1,
                     options: .curveEaseInOut, animations: {
                      view.transform = CGAffineTransform.identity
      }, completion: { _ in
        completion()
      })
    })
  }

  public static func fadeOut() -> Action {
    return Action(animation: { view, completion in
      UIView.animate(withDuration: 0.25, animations: {
        view.alpha = 0
      }, completion: { _ in
        completion()
      })
    })
  }

  public static func fadeIn() -> Action {
    return Action(animation: { view, completion in
      UIView.animate(withDuration: 0.25, animations: {
        view.alpha = 1
      }, completion: { _ in
        completion()
      })
    })
  }

  public static func flash() -> Action {
    return .sequence([
      .fadeOut(),
      .fadeIn()
    ])
  }
}
