//
// Created by Karol on 20.02.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

import Foundation

class TestFactory {

    let availableTests: [String] = [
        String(describing: ArrayInsertionTestObjC.self),
        String(describing: ArrayInsertionTestSwift.self)
    ]

    func buildTest(forName name: String, n: Int) -> Test {
        switch name {
            case String(describing: ArrayInsertionTestObjC.self):
                return ArrayInsertionTestObjC(numberOfInsertions: Int32(n))
            case String(describing: ArrayInsertionTestSwift.self):
                return ArrayInsertionTestSwift(numberOfInsertions: n)
            default:
                fatalError("Unknown test")
        }
    }
}