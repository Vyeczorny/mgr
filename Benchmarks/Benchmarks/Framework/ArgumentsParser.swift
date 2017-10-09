//
//  ArgumentsParser.swift
//  Benchmarks
//
//  Created by Karol Wieczorek on 12.09.2017.
//  Copyright © 2017 Karol Wieczorek. All rights reserved.
//

import Foundation

enum ExportOutput {
    case gnuplot
}

struct RunningOptions {
    let tests: [String]
    let n: Int
    let range: Int
    let repetitions: Int
}

enum Command {
    case list
    case run(RunningOptions)
    case error(String)
}

class ArgumentsParser {

    func parse(arguments: [String]) -> Command {

        if arguments.count == 0 {
            return .error("Brak argumentów")
        }

        let command = arguments[1]

        if command == "list" {
            return .list
        }

        if command == "run" {
            var index = 2
            var testNames = [String]()
            var n = 1
            var range = 0
            var repetitions = 1

            while index < arguments.count, !arguments[index].hasPrefix("-") {
                testNames.append(arguments[index])
                index += 1
            }

            while index < arguments.count {
                let option = arguments[index]
                if option == "-n" {
                    n = Int(arguments[index + 1])!
                    index += 2
                    continue
                }
                if option == "-range" {
                    range = Int(arguments[index + 1])!
                    index += 2
                    continue
                }
                if option == "-repetitions" {
                    repetitions = Int(arguments[index + 1])!
                    index += 2
                    continue
                }

                return .error("Nieznana opcja: \(arguments[index])")
            }

            return .run(
                RunningOptions(
                    tests: testNames,
                    n: n,
                    range: range,
                    repetitions: repetitions
                )
            )
        }

        //
        //if command == "run" {
        //    if CommandLine.arguments.count <= 2 {
        //        print("Brak nazwy testu")
        //        exit(-1)
        //    }
        //
        //    let testName = CommandLine.arguments[2]
        //
        //    guard let test = availableTests[testName] else {
        //        print("Test o nazwie \(testName) nie został znaleziony")
        //        exit(-1)
        //    }
        //
        //    test.objcTest.run()
        //}
        //


        return .error("Unknown error")
    }
}
