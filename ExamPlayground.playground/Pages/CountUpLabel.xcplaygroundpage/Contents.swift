//: A UIKit based Playground for presenting user interface
  
import UIKit
import CountupAnimationLabel
import PlaygroundSupport
import RxSwift

class MyViewController : UIViewController {
    var label: UILabel?
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        label?.lineBreakMode = .byCharWrapping
        label?.numberOfLines = 0
        view.addSubview(label!)

        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 150, width: 100, height: 50)
        button.setTitle("reload", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.addTarget(self, action: #selector(reload), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func reload() {
        label?.animate(start: 1000, end: 20000, duration: 1)
            .drive()
            .disposed(by: disposeBag)
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
