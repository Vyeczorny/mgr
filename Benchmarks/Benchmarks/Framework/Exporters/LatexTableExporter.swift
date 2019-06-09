//
// Created by Karol Wieczorek on 2019-05-28.
// Copyright (c) 2019 Karol Wieczorek. All rights reserved.
//

import Foundation

class LatexTableExporter {
    func export(testSuiteResult: TestSuiteResult) {

        print("\\begin{tabular}{ c c c c }")
        var header2 = "$n$ "
        for testResult in testSuiteResult.testResults {
//            header += "c "
            header2 += " & \(testResult.name)"
        }
        header2 += " & Swift/Objective-C \\\\"
        print(header2)

        for i in 0..<testSuiteResult.testResults[0].testResults.count {
            let first = testSuiteResult.testResults[0].testResults[i]
            let second = testSuiteResult.testResults[1].testResults[i]
            var line = ""
            line += String(format: "%.5f", first.n)
            line += String(format: " & %.5f", first.averageTime)
            line += String(format: " & %.5f", second.averageTime)
            line += String(format: " & %.5f", first.averageTime / second.averageTime)

            line += " \\\\"
            print(line)
        }
        print("\\end{tabular}")
    }
}