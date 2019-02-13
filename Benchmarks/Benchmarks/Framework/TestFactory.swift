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
            name: "DijkstraObjC",
            generatingFunction: { DijkstraTestObjC(n: Int32($0)) }
        ),
        TestInformation(
            name: "DijkstraOptimizedObjC",
            generatingFunction: { DijkstraOptimizedTestObjC(n: Int32($0)) }
        ),
        TestInformation(
            name: "MessageDispatchObjC",
            generatingFunction: { MessageDispatchTestObjC(n: Int32($0)) }
        ),
        TestInformation(
            name: "SieveOfEratosthenesObjC",
            generatingFunction: { SieveOfEratosthenesTestObjC(n: Int32($0)) }
        ),
        TestInformation(
            name: "RGBHistogramObjC",
            generatingFunction: { RGBHistogramTestObjC(n: Int32($0)) }
        ),
        TestInformation(
            name: "CountLinesWordsCharsObjC",
            generatingFunction: { CountLinesWordsCharsTestObjC(n: Int32($0)) }
        ),
        TestInformation(
            name: "StringConcatenationObjC",
            generatingFunction: { StringConcatenationTestObjC(n: Int32($0)) }
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
            generatingFunction: StaticDispatchTestSwift.init
        ),
        TestInformation(
            name: "DynamicDispatchSwift",
            generatingFunction: DynamicDispatchTestSwift.init
        ),
        TestInformation(
            name: "DijkstraSwift",
            generatingFunction: DijkstraTestSwift.init
        ),
        TestInformation(
            name: "DijkstraOptimizedSwift",
            generatingFunction: DijkstraOptimizedTestSwift.init
        ),
        TestInformation(
            name: "SieveOfEratosthenesSwift",
            generatingFunction: SieveOfEratosthenesTestSwift.init
        ),
        TestInformation(
            name: "RGBHistogramSwift",
            generatingFunction: RGBHistogramTestSwift.init
        ),
        TestInformation(
            name: "CountLinesWordsCharsSwift",
            generatingFunction: CountLinesWordsCharsTestSwift.init
        ),
        TestInformation(
            name: "StringConcatenationSwift",
            generatingFunction: StringConcatenationTestSwift.init
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