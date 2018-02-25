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
        print("Wyniki testów:")
        for testResult in testSuiteResult.testResults {
            print("Test:")
            for result in testResult.allTimes {
                print("\(result)")
            }
            print("Średnia: \(testResult.averageTime)")
        }

    }
}

class ResultExporter {
    func export(testSuiteResult: TestSuiteResult, exportOption: ExportOption) {
        switch exportOption {
            case .terminal:
                TerminalExporter().export(testSuiteResult: testSuiteResult)
            case .gnuplot:
                 fatalError("Not implemented")
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
        let result = testSuiteRunner.runTestSuite(withOptions: options)
        ResultExporter().export(testSuiteResult: result, exportOption: options.export)
}
