//
//  CountupAnimationLabelTests.swift
//  CountupAnimationLabelTests
//
//  Created by 日野森寛也 on 2019/04/05.
//  Copyright © 2019 Hiroya Hinomori. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import RxTest
import RxBlocking

@testable import CountupAnimationLabel

class CountupAnimationLabelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
//        let ref = Array(0...10).map { Float($0) / 10 }
//        let easing = ref.map { quadraticEaseInOut(x: $0) }
//        print(easing(separeteCount: 30))
        let label = UILabel()
        XCTAssertNoThrow(try label.animate(start: 0, end: 5300, duration: 1).toBlocking().toArray())
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

//    func easing(separeteCount: Int) -> [Float] {
//        let ref = Array(0...separeteCount).map { Float($0) / Float(separeteCount) }
//        return ref.map { quadraticEaseInOut(x: $0) }
//    }
//    func quadraticEaseInOut(x: Float) -> Float {
//        if x < 1 / 2 {
//            return 2 * x * x
//        } else {
//            return (-2 * x * x) + (4 * x) - 1
//        }
//    }

}
