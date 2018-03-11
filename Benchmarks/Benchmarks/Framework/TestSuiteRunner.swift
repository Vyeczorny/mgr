//
// Created by Karol on 25.02.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

import Foundation

struct TestSuiteResult {
    let testResults: [TestResult]
}

class TestSuiteRunner {

    private let testRunner = TestRunner()

    func runTests(_ tests: [String], from: Int, to: Int, step: Int, numberOfRepetitions: Int) -> TestSuiteResult {
        return TestSuiteResult(testResults: tests.map {
            print("RUNNING TEST: \($0)")
            return testRunner.runTest(withName: $0, from: from, to: to, step: step, numberOfRepetitions: numberOfRepetitions)
        })
    }
}
