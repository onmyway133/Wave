import UIKit
import Wave

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var box1: UIView!
  @IBOutlet weak var box2: UIView!
  @IBOutlet weak var box3: UIView!

  var items: [Item] = []

  override func viewDidLoad() {
    super.viewDidLoad()

    box3.layer.cornerRadius = box3.frame.width/2

    setup()
  }

  @IBAction func reset(sender: UIButton) {
    
  }

  func setup() {
    let box1 = self.box1
    let box2 = self.box2
    let box3 = self.box3

    // Ride

    items.append(Item(name: "flipX", action: {
      box1.wave.flipX()
    }))

    items.append(Item(name: "flipY", action: {
      box1.wave.flipY()
    }))

    items.append(Item(name: "flash", action: {
      box1.wave.flash()
    }))

    items.append(Item(name: "shake", action: {
      box1.wave.shake()
    }))

    items.append(Item(name: "pop", action: {
      box1.wave.pop()
    }))

    items.append(Item(name: "morph", action: {
      box1.wave.morph()
    }))

    items.append(Item(name: "squeeze", action: {
      box1.wave.squeeze()
    }))

    items.append(Item(name: "wobble", action: {
      box1.wave.wobble()
    }))

    items.append(Item(name: "swing", action: {
      box1.wave.swing()
    }))

    // View

    items.append(Item(name: "view rotate move move", action: {
        Chain<View.BasicAnimation>()
        .newAction()
        .view(box1)
        .rotate(M_PI_2)
        .newAction()
        .block {
          box2.frame.origin.y -= 40
          box3.frame.origin.y += 10
        }
        .run()
    }))

    // Layer

    tableView.reloadData()
  }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let item = items[indexPath.row]

    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
    cell.textLabel?.text = item.name

    return cell
  }

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    
    let item = items[indexPath.row]
    item.action()
  }
}
