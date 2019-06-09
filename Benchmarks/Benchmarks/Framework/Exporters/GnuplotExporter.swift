//
// Created by Karol on 21.08.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

import Foundation

class GnuplotExporter {

    private let runningOptions: RunningOptions

    init(runningOptions: RunningOptions) {
        self.runningOptions = runningOptions
    }

    func export(testSuiteResult: TestSuiteResult) {
        let dataFile = "data.txt"
        let scriptFile = "script.gpl"
        let outputFile = "output.eps"
        write(testSuiteResult: testSuiteResult, toFile: dataFile)

        var content = """
        set terminal postscript eps enhanced color
        set output '\(outputFile)'
        set key reverse left top Left
        
        """

        if runningOptions.plotScale  == .log {
            content += "set log y\n"
        }

        content += "plot "

        for i in 0..<testSuiteResult.testResults.count {
            content += " '\(dataFile)' using 1:\(i+2) title '\(testSuiteResult.testResults[i].name)' lc rgb 'black',"
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