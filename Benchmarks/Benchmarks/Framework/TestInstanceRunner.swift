//
//  TestInstanceRunner.swift
//  Benchmarks
//
//  Created by Karol Wieczorek on 18.08.2017.
//  Copyright © 2017 Karol Wieczorek. All rights reserved.
//

import Foundation

@objc protocol Test {
    func run()
}

struct TestInstanceResult {
    let name: String
    let n: Int
    let allTimes: [Double]

    var averageTime: Double {
        return allTimes.reduce(0, +) / Double(allTimes.count)
    }
}

class TestInstanceRunner {

    private let testFactory = TestFactory()

    func runTest(withName testName: String, n: Int, numberOfRepetitions: Int) -> TestInstanceResult {
        return TestInstanceResult(name: testName, n: n, allTimes: Array(0..<numberOfRepetitions).map {
            runSingleTest(test: testFactory.buildTest(forName: testName, n: $0))
        })
    }

    private func runSingleTest(test: Test) -> Double {
        let startTime = Date().timeIntervalSince1970
        test.run()
        let endTime = Date().timeIntervalSince1970
        return endTime - startTime
    }
}
