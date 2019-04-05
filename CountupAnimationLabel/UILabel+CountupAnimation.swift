//
//  UILabel+CountupAnimation.swift
//  CountupAnimationLabel
//
//  Created by 日野森寛也 on 2019/04/05.
//  Copyright © 2019 Hiroya Hinomori. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

extension UILabel {

    public func animate(start: Int, end: Int, duration: Float) -> Driver<Int> {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        self.text = formatter.string(for: start)
        let delta = end - start
        let easeInOut = easing(separeteCount: 1000)
        let interval = RxTimeInterval(0.001)

        let timer = Observable<Int>.interval(interval, scheduler: MainScheduler.instance)
        return timer
            .takeWhile { $0 < 1001 }
            .map { Int(Float(delta) * easeInOut[$0]) + start }
            .do(onNext: { [weak self] (count) in
                self?.text = formatter.string(for: count)
            })
            .asDriver(onErrorJustReturn: 0)
    }

    func easing(separeteCount: Int) -> [Float] {
        let ref = Array(0...separeteCount).map { Float($0) / Float(separeteCount) }
        return ref.map { quadraticEaseInOut(x: $0) }
    }

    func quadraticEaseInOut(x: Float) -> Float {
        if x < 1 / 2 {
            return 2 * x * x
        } else {
            return (-2 * x * x) + (4 * x) - 1
        }
    }

}
