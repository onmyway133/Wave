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
      box1.wave.flipX().run()
    }))

    items.append(Item(name: "flipY", action: {
      box1.wave.flipY().run()
    }))

    items.append(Item(name: "flash", action: {
      box1.wave.flash().run()
    }))

    items.append(Item(name: "shake", action: {
      box1.wave.shake().run()
    }))

    items.append(Item(name: "pop", action: {
      box1.wave.pop().run()
    }))

    items.append(Item(name: "morph", action: {
      box1.wave.morph().run()
    }))

    items.append(Item(name: "squeeze", action: {
      box1.wave.squeeze().run()
    }))

    items.append(Item(name: "wobble", action: {
      box1.wave.wobble().run()
    }))

    items.append(Item(name: "swing", action: {
      box1.wave.swing().run()
    }))

    // Basic

    items.append(Item(name: "wait log", action: {
      Chain<View.Action>()
      .add(ViewBasicAnimation().view(box1).fadeOut())
      .thenLog("done fade out")
      .thenWait(2)
      .then()
      .add(ViewBasicAnimation().view(box1).fadeIn())
      .thenLog("done fade in")
      .run()
    }))

    // View

    items.append(Item(name: "view rotate move move", action: {
      Chain<View.Action>()
      .add(ViewBasicAnimation().view(box1).rotate(M_PI_4))
      .then()
      .add(ViewBasicAnimation().view(box2).moveX(-10))
      .then()
      .add(ViewSpringAnimation()
        .block {
          box3.frame.origin.y += 10
        }
      )
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
