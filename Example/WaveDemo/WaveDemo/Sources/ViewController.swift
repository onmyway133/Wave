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

  func setup() {
    let box1 = self.box1
    let box2 = self.box2
    let box3 = self.box3

    items.append(Item(name: "flipX", action: {
      box1?.run(.flipX())
    }))

    items.append(Item(name: "flipY", action: {
      box1?.run(.flipY())
    }))

    items.append(Item(name: "flash", action: {
      box1?.run(.flash())
    }))

    items.append(Item(name: "shake", action: {
      box1?.run(.shake())
    }))

    items.append(Item(name: "pop", action: {
      box1?.run(.pop())
    }))

    items.append(Item(name: "morph", action: {
      box1?.run(.morph())
    }))

    items.append(Item(name: "squeeze", action: {
      box1?.run(.squeeze())
    }))

    items.append(Item(name: "wobble", action: {
      box1?.run(.wobble())
    }))

    items.append(Item(name: "swing", action: {
      box1?.run(.swing())
    }))

    items.append(Item(name: "log", action: {
      box1?.run(.sequence([
        .moveX(50),
        .log("View has just been moved 50"),
        .moveX(-50)
      ]))
    }))

    items.append(Item(name: "composite", action: {
      box1?.run(.sequence([
        .fadeOut(),
        .fadeIn(),
        .parallel([
          .sequence([
            .shake(),
            .flipX()
          ])
        ])
      ]))
    }))

    items.append(Item(name: "blink", action: {
      box1?.run(.fadeOut(), completion: {
        box2?.run(.fadeOut(), completion: {
          box3?.run(.fadeOut())
        })
      })
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
