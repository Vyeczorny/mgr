//
// Created by Karol Wieczorek on 2019-02-24.
// Copyright (c) 2019 Karol Wieczorek. All rights reserved.
//

import Foundation

class MultipleGnuplotExporter {

    func export(testSuiteResult: TestSuiteResult) {
        print("--- Running multiple exporter ---")
        let dataFile = "data.txt"
        let scriptFile = "script.gpl"
        let outputFile = "output.eps"
        write(testSuiteResult: testSuiteResult, toFile: dataFile)

        var content = """
                      set terminal postscript eps enhanced color
                      set output '\(outputFile)'
                      set key reverse left top Left
                      set multiplot layout 2,\(ceil(Double(testSuiteResult.testResults.count) / 2.0))

                      """

        var groupedTests = [String: [(Int, TestResult)]]()

        for (index, testResult) in testSuiteResult.testResults.enumerated() {
            let shortName = testResult.name
                .replacingOccurrences(of: "Swift", with: "")
                .replacingOccurrences(of: "ObjC", with: "")

            groupedTests[shortName] = (groupedTests[shortName] ?? []) + [(index, testResult)]
        }


        groupedTests.forEach { (group, tests) in
            content += "plot"

            for (i, _) in tests {
                content += " '\(dataFile)' using 1:\(i+2) title '\(testSuiteResult.testResults[i].name)' pt 7 ps 0.5,"
            }

            content += "\n"
        }

        FileManager.default.createFile(atPath: scriptFile, contents: content.data(using: .utf8))

        let task = Process()
        task.launchPath = "/usr/local/bin/gnuplot"
        task.arguments = [scriptFile]
        task.launch()
        task.waitUntilExit()
    }

    private func write(testSuiteResult: TestSuiteResult, toFile file: String) {
        let testResults = testSuiteResult.testResults
        let content = Array(0..<testResults[0].testResults.count)
            .map { i in String(format: "%d\t%@", arguments: [
                testResults[0].testResults[i].n,
                testResults.map {
                    String($0.testResults[i].averageTime)
                }.joined(separator: "\t")
            ])
            }.joined(separator: "\n")

        FileManager.default.createFile(atPath: file, contents: content.data(using: .utf8))
    }
}
