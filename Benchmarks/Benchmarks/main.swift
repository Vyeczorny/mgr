//
//  main.swift
//  Benchmarks
//
//  Created by Karol Wieczorek on 18.08.2017.
//  Copyright © 2017 Karol Wieczorek. All rights reserved.
//

import Foundation

class TerminalExporter {
    func export(testSuiteResult: TestSuiteResult) {
        print("-----------------------------------------------------------------------------------------------\n")
        print("WYNIKI TESTÓW:\n")

        for testResult in testSuiteResult.testResults {
            print("Test: \(testResult.name)")
            for testInstanceResult in testResult.testResults {
                print("\(testInstanceResult.n) -> \(String(format: "%.5f", testInstanceResult.averageTime)) s")
            }
            print("\n")
        }
        print("-----------------------------------------------------------------------------------------------\n")
    }
}

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

        """

        if runningOptions.plotScale == .log {
            content += "set log y\n"
        }

        content += "plot "

        for i in 0..<testSuiteResult.testResults.count {
            content += " '\(dataFile)' using 1:\(i+2) title '\(testSuiteResult.testResults[i].name)' pt 7 ps 0.5,"
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

class ResultExporter {
    func export(testSuiteResult: TestSuiteResult, runningOptions: RunningOptions) {
        switch runningOptions.export {
            case .terminal:
                TerminalExporter().export(testSuiteResult: testSuiteResult)
            case .gnuplot:
                GnuplotExporter(runningOptions: runningOptions).export(testSuiteResult: testSuiteResult)
        }
    }
}

// App

let argumentsParser = ArgumentsParser()
let command = argumentsParser.parse(arguments: CommandLine.arguments)

switch command {
    case .error(let text):
        print("BŁĄD: \(text)")
    case .list:
        let factory = TestFactory()
        let message = "Dostępne testy:\n\n" + factory.availableTests.joined(separator: "\n")
         print(message)
    case .run(let options):
        let testSuiteRunner = TestSuiteRunner()
        let result = testSuiteRunner.runTests(
                options.tests,
                from: options.from,
                to: options.to,
                step: options.step,
                numberOfRepetitions: options.repetitions
        )
        ResultExporter().export(testSuiteResult: result, runningOptions: options)
}
