import UIKit

public extension Action {
  public static func log(_ string: String) -> Action {
    return Action(animation: { view, completion in
      print(string)
      completion()
    })
  }
}
