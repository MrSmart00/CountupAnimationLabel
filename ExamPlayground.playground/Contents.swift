//: A UIKit based Playground for presenting user interface
  
import UIKit
import CountupAnimationLabel
import PlaygroundSupport

class MyViewController : UIViewController {
    var label: UILabel?

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        label?.lineBreakMode = .byCharWrapping
        label?.numberOfLines = 0
        view.addSubview(label!)
        self.view = view
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        label?.animate(start: 1000, end: 5350, duration: 1).drive()
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
