//
// Created by Karol on 20.02.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

import Foundation

private struct TestInformation {
    let name: String
    let generatingFunction: (Int) -> Test
}

class TestFactory {

    private let tests: [TestInformation] = [
        TestInformation(
            name: "ArrayInsertionObjC",
            generatingFunction: { ArrayInsertionTestObjC(n: Int32($0)) }
        ),
        TestInformation(
            name: "FibonacciObjC",
            generatingFunction: { FibonacciTestObjC(n: Int32($0)) }
        ),
        TestInformation(
            name: "PlaygroundObjC",
            generatingFunction: { PlaygroundTestObjC(n: Int32($0)) }
        ),
        TestInformation(
            name: "BubbleSortObjC",
            generatingFunction: { BubbleSortTestObjC(n: Int32($0)) }
        ),
        TestInformation(
            name: "BubbleSortOptimizedObjC",
            generatingFunction: { BubbleSortOptimizedTestObjC(n: Int32($0)) }
        ),
        TestInformation(
            name: "BinarySearchTreeObjC",
            generatingFunction: { BinarySearchTreeTestObjC(n: Int32($0)) }
        ),
        TestInformation(
            name: "ArrayInsertionSwift",
            generatingFunction: ArrayInsertionTestSwift.init
        ),
        TestInformation(
            name: "AckermannSwift",
            generatingFunction: { AckermannTestSwift(m: Int64($0), n: Int64($0)) }
        ),
        TestInformation(
            name: "FibonacciSwift",
            generatingFunction: FibonacciTestSwift.init
        ),
        TestInformation(
            name: "PlaygroundSwift",
            generatingFunction: PlaygroundTestSwift.init
        ),
        TestInformation(
            name: "BubbleSortSwift",
            generatingFunction: BubbleSortTestSwift.init
        ),
        TestInformation(
            name: "BinarySearchTreeClassicSwift",
            generatingFunction: BinarySearchTreeClassicTestSwift.init
        ),
        TestInformation(
            name: "BinarySearchTreeEnumSwift",
            generatingFunction: BinarySearchTreeEnumsTestSwift.init
        )
    ]

    var testNames: [String] {
        return tests.map { $0.name }
    }

    func buildTest(forName name: String, n: Int) -> Test {
        guard let test = tests.filter({ $0.name == name }).first?.generatingFunction(n) else {
        fatalError("Unknown test: \(name)")
        }
        return test
    }
}