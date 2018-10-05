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
            name: "MessageDispatchObjC",
            generatingFunction: { MessageDispatchTestObjC(n: Int32($0)) }
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
        ),
        TestInformation(
            name: "BinarySearchTreeOptimizedClassicSwift",
            generatingFunction: BinarySearchTreeOptimizedClassicTestSwift.init
        ),
        TestInformation(
            name: "StaticDispatchSwift",
            generatingFunction: StaticDispatchSwift.init
        ),
        TestInformation(
            name: "DynamicDispatchSwift",
            generatingFunction: DynamicDispatchSwift.init
        )
    ]

    var testNames: [String] {
        return tests.map { $0.name }
    }

    func buildTest(forName name: String, n: Int) -> Test {
        guard let testInformation = getTestInformation(name: name) else {
            fatalError("Unknown test: \(name)")
        }
        return testInformation.generatingFunction(n)
    }

    private func getTestInformation(name: String) -> TestInformation? {
        return tests.filter({ $0.name == name }).first
    }
}