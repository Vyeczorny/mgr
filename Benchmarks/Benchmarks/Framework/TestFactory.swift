//
// Created by Karol on 20.02.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

import Foundation

class TestFactory {

    let availableTests: [String] = [
        String(describing: ArrayInsertionTestObjC.self),
        String(describing: FibonacciTestObjC.self),

        String(describing: ArrayInsertionTestSwift.self),
        String(describing: AckermannTestSwift.self),
        String(describing: FibonacciTestSwift.self)
    ]

    func buildTest(forName name: String, n: Int) -> Test {
        switch name {
            case String(describing: ArrayInsertionTestObjC.self):
                return ArrayInsertionTestObjC(numberOfInsertions: Int32(n))
            case String(describing: FibonacciTestObjC.self):
                return FibonacciTestObjC(n: Int32(n))

            case String(describing: ArrayInsertionTestSwift.self):
                return ArrayInsertionTestSwift(numberOfInsertions: n)
            case String(describing: AckermannTestSwift.self):
                return AckermannTestSwift(m: Int64(n), n: Int64(n))
            case String(describing: FibonacciTestSwift.self):
                return FibonacciTestSwift(n: n)
            default:
                fatalError("Unknown test: \(name)")
        }
    }
}