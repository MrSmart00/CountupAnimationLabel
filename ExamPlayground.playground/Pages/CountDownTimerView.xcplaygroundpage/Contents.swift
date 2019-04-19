//: [Previous](@previous)

import Foundation
import CountupAnimationLabel
import PlaygroundSupport
import RxSwift
import RxCocoa

var str = "Hello, playground"

class CountDownView: UIView {
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    private func commonInit() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
    }
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let countView = CountDownView(frame: CGRect(x: 10, y: 10, width: 300, height: 50))
        countView.backgroundColor = .purple
        view.addSubview(countView)
    }
}

PlaygroundPage.current.liveView = ViewController()
//: [Next](@next)
