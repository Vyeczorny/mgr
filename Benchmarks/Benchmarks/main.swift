//
//  main.swift
//  Benchmarks
//
//  Created by Karol Wieczorek on 18.08.2017.
//  Copyright © 2017 Karol Wieczorek. All rights reserved.
//

import Foundation

//let testSwift: Test = RC4TestSwift(n: 20)
//testSwift.run()
//
//let testObjC: Test = RC4TestObjC(n: Int32(20))
//testObjC.run()
//exit(0)

////

let argumentsParser = ArgumentsParser()
let command = argumentsParser.parse(arguments: CommandLine.arguments)

switch command {
case .error(let text):
    print("BŁĄD: \(text)")
case .list:
    let factory = TestFactory()
    let message = "Dostępne testy:\n\n" + factory.testNames.joined(separator: "\n")
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