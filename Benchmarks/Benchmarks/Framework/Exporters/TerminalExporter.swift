//
// Created by Karol on 21.08.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

import Foundation

class TerminalExporter {
    func export(testSuiteResult: TestSuiteResult) {
        print("WYNIKI TESTÓW:")

        for testResult in testSuiteResult.testResults {
            print("Test: \(testResult.name)")
            for testInstanceResult in testResult.testResults {
                print("\(testInstanceResult.n) -> \(String(format: "%.5f", testInstanceResult.averageTime)) s")
            }
            print("\n")
        }
    }
}