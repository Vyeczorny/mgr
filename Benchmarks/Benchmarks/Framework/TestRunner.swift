//
//  TestRunner.swift
//  Benchmarks
//
//  Created by Karol Wieczorek on 13.09.2017.
//  Copyright © 2017 Karol Wieczorek. All rights reserved.
//

import Foundation

struct TestResult {
    let name: String
    let from: Int
    let to: Int
    let testResults: [TestInstanceResult]

    var averageTimes: Double {
        return testResults.map{ $0.averageTime }.reduce(0, +) / Double(testResults.count)
    }
}

class TestRunner {

    private let testInstanceRunner = TestInstanceRunner()

    func runTest(withName name: String, from: Int, to: Int, numberOfRepetitions: Int) -> TestResult {
        return TestResult(name: name, from: from, to: to, testResults: Array(from...to).map {
            testInstanceRunner.runTest(
                    withName: name,
                    n: $0,
                    numberOfRepetitions: numberOfRepetitions
            )
        })
    }
}
