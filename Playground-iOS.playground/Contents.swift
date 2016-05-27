// Wave iOS Playground

import UIKit
import Wave

let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
button.setTitle("Hello", forState: .Normal)
button.setTitleColor(UIColor.redColor(), forState: .Normal)

View.BasicChain(view: button)
.moveX(20).duration(10).delay(2).option([.CurveEaseInOut, .Autoreverse])
.rotate(M_PI_2).replay(2)
.link(View.SpringChain(view: button))
.moveX(2).delay(2).damping(2.5).velocity(5)
.run()
