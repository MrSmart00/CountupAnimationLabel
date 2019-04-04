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
        let interval = RxTimeInterval(duration / (Float(end) - Float(start)))
        let timer = Observable<Int>.interval(interval, scheduler: MainScheduler.instance)
        return timer
            .takeWhile { $0 <= (end - start) }
            .map { $0 + start }
            .do(onNext: { [weak self] (count) in
                self?.text = formatter.string(for: count)
            })
            .asDriver(onErrorJustReturn: 0)
    }
}
