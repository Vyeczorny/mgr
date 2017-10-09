//
//  TestSuiteRunner.swift
//  Benchmarks
//
//  Created by Karol Wieczorek on 13.09.2017.
//  Copyright © 2017 Karol Wieczorek. All rights reserved.
//

import Foundation

struct TestSuiteResult {
    let testResults: [TestResult]

    var averageTimes: Double {
        return testResults.map{ $0.averageTime }.reduce(0, +) / Double(testResults.count)
    }
}

class TestSuiteRunner {

    func runTestSuite(withOptions options: RunningOptions) -> TestSuiteResult {
        var results = [TestResult]()

        for n in options.n...(options.n + options.range) {
            let runner = TestRunner(numberOfRepetitions: options.repetitions)
            let test = getTest(withName: options.tests[0], n: n)!
            results.append(runner.run(test: test))
        }

        return TestSuiteResult(testResults: results)
    }

    private func getTest(withName name: String, n: Int) -> Test? {
        switch name {
            case "array_insertion_objc":
                return ArrayInsertionTestObjC(numberOfInsertions: Int32(n))
            case "array_insertion_swift":
                return ArrayInsertionTestSwift(numberOfInsertions: n)
            default:
                return nil
        }
    }

}
