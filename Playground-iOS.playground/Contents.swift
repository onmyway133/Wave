// Wave iOS Playground

import UIKit
import Wave
import XCPlayground

// MARK: - Setup

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 667))

let view = UIView()
containerView.addSubview(view)

view.backgroundColor = UIColor.redColor()
view.frame.size = CGSize(width: 100, height: 100)
view.center = CGPoint(x: containerView.frame.size.width/2,
                      y: containerView.frame.size.height/2)


// MARK: - Wave


// MARK: - Live

XCPlaygroundPage.currentPage.liveView = containerView
