//
//  main.swift
//  Benchmarks
//
//  Created by Karol Wieczorek on 18.08.2017.
//  Copyright © 2017 Karol Wieczorek. All rights reserved.
//

import Foundation

// App

let argumentsParser = ArgumentsParser()

let command = argumentsParser.parse(arguments: CommandLine.arguments)

print("Command = \(command)")

switch command {
    case .error(let text):
        print("BŁĄD: \(text)")
    case .list:
        exit(-1)
    case .run(let options):
        let testSuiteRunner = TestSuiteRunner()
        let result = testSuiteRunner.runTestSuite(withOptions: options)
        print("RESULT: \(result)")
}
