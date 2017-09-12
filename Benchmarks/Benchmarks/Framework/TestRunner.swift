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

struct TestResults {
    let allTimes: [Double]
    let averageTime: Double
}

class TestRunner {

    private let numberOfRepeats: Int

    init(numberOfRepeats: Int) {
        self.numberOfRepeats = numberOfRepeats
    }

    func run(test: Test) -> TestResults {
        var allTimes = [Double]()

        for _ in 0..<numberOfRepeats {
            let time = runSingleTest(test: test)
            allTimes.append(time)
        }

        let averageTime = allTimes.reduce(0, +) / Double(allTimes.count)

        return TestResults(allTimes: allTimes, averageTime: averageTime)
    }

    private func runSingleTest(test: Test) -> Double {
        let startTime = Date().timeIntervalSince1970
        test.run()
        let endTime = Date().timeIntervalSince1970
        return endTime - startTime
    }
}
