import UIKit
import Wave

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var box1: UIView!
  @IBOutlet weak var box2: UIView!
  @IBOutlet weak var box3: UIView!

  var items: [Item] = []
  var counter = 0

  override func viewDidLoad() {
    super.viewDidLoad()

    box3.layer.cornerRadius = box3.frame.width/2

    setup()
  }

  @IBAction func reset(sender: UIButton) {
    view.setNeedsLayout()
  }

  func setup() {
    let box1 = self.box1
    let box2 = self.box2
    let box3 = self.box3

    // Ride

    items.append(Item(name: "flipX", action: {
      box1?.wave(action: .flipX())
    }))

    items.append(Item(name: "flipY", action: {
//      box1.wave.flipY().run()
    }))

    items.append(Item(name: "flash", action: {
//      box1.wave.flash().run()
    }))

    items.append(Item(name: "shake", action: {
//      box1.wave.shake().run()
    }))

    items.append(Item(name: "pop", action: {
//      box1.wave.pop().run()
    }))

    items.append(Item(name: "morph", action: {
//      box1.wave.morph().run()
    }))

    items.append(Item(name: "squeeze", action: {
//      box1.wave.squeeze().run()
    }))

    items.append(Item(name: "wobble", action: {
//      box1.wave.wobble().run()
    }))

    items.append(Item(name: "swing", action: {
//      box1.wave.swing().run()
    }))

    // View

    items.append(Item(name: "view move change color", action: {
//      Chain<View.Action>()
//        .view(box2)
//        .add(ViewBasicAnimation().fadeOut().moveX(20))
//        .add(ViewBasicAnimation().changeBackground(UIColor.blueColor()))
//        .run()
    }))

    items.append(Item(name: "blink", action: {
//      Chain<View.Action>()
//        .add(ViewBasicAnimation().view(box1).fadeOut())
//        .add(ViewBasicAnimation().view(box2).fadeOut())
//        .add(ViewBasicAnimation().view(box3).fadeOut())
//        .then()
//        .add(ViewBasicAnimation().view(box1).fadeIn())
//        .add(ViewBasicAnimation().view(box2).fadeIn())
//        .add(ViewBasicAnimation().view(box3).fadeIn())
//        .run()
    }))

    items.append(Item(name: "wait log", action: {
//      Chain<View.Action>()
//      .add(ViewBasicAnimation().view(box1).fadeOut())
//      .thenLog("done fade out")
//      .thenWait(1)
//      .then()
//      .add(ViewBasicAnimation().view(box1).fadeIn())
//      .thenLog("done fade in")
//      .run()
    }))

    items.append(Item(name: "view rotate move move", action: {
//      Chain<View.Action>()
//      .add(ViewBasicAnimation()
//        .view(box3)
//        .moveY(100)
//        .delay(2)
//        .duration(3)
//        .repeatCount(2)
//        .options([UIViewAnimationOptions.CurveEaseIn]))
//      .then()
//      .add(ViewBasicAnimation().view(box2).moveX(-10))
//      .then()
//      .add(ViewSpringAnimation()
//        .block {
//          self.counter = (self.counter + 1) % 4
//          box1.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4) * CGFloat(self.counter))
//        }
//      )
//      .run()
    }))

    items.append(Item(name: "layer then view", action: {
//      box1.wave.swing()
//      .then(Chain<View.Action>())
//      .add(ViewBasicAnimation().view(box1).moveX(10))
//      .then()
//      .add(ViewBasicAnimation().view(box1).moveY(10))
//      .run()
    }))

    // Layer

    items.append(Item(name: "layer path", action: {
//      let path = UIBezierPath(arcCenter: box2.center, radius: 100, startAngle: 10, endAngle: 100, clockwise: true)
//
//      Chain<Layer.Action>()
//      .layer(box2.layer)
//      .add(LayerKeyframeAnimation()
//        .keyPath("position")
//        .calculationMode(Layer.CalculationMode.Paced)
//        .fillMode(Layer.FillMode.Forwards)
//        .duration(3)
//        .path(path)
//      )
//      .run()

    }))

    items.append(Item(name: "layer morph and flash", action: {
//      box1.wave.morph()
//      .then(box1.wave.flash())
//      .run()
    }))

    tableView.reloadData()
  }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let item = items[indexPath.row]

    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = item.name

    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)

    let item = items[indexPath.row]
    item.action()
  }
}
