//
//  TestRunner.swift
//  Benchmarks
//
//  Created by Karol Wieczorek on 18.08.2017.
//  Copyright © 2017 Karol Wieczorek. All rights reserved.
//

import Foundation

@objc protocol Test {
    func run()
}

struct TestResult {
    let allTimes: [Double]

    var averageTime: Double {
        return allTimes.reduce(0, +) / Double(allTimes.count)
    }
}

class TestRunner {

    private let numberOfRepetitions: Int

    init(numberOfRepetitions: Int) {
        self.numberOfRepetitions = numberOfRepetitions
    }

    func run(test: Test) -> TestResult {
        var allTimes = [Double]()

        for _ in 0..<numberOfRepetitions {
            let time = runSingleTest(test: test)
            allTimes.append(time)
        }

        return TestResult(allTimes: allTimes)
    }

    private func runSingleTest(test: Test) -> Double {
        let startTime = Date().timeIntervalSince1970
        test.run()
        let endTime = Date().timeIntervalSince1970
        return endTime - startTime
    }
}
