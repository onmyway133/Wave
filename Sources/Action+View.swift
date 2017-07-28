import UIKit

public extension Action {
  public static func move() -> Action {
    return Action(animation: { view, completion in
      UIView.animate(withDuration: 2, animations: {
        view.frame.origin.x += 2
      }, completion: { _ in
        completion()
      })
    })
  }

  public static func morph() -> Action {
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
}
