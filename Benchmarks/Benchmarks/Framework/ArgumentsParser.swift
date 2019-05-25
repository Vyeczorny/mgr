//
//  ArgumentsParser.swift
//  Benchmarks
//
//  Created by Karol Wieczorek on 12.09.2017.
//  Copyright © 2017 Karol Wieczorek. All rights reserved.
//

import Foundation

enum ExportOption: String {
    case terminal
    case gnuplot
    case mGnuplot
}

enum PlotScale: String {
    case linear
    case log
}

struct RunningOptions {
    let tests: [String]
    let from: Int
    let to: Int
    let repetitions: Int
    let step: Int
    let export: ExportOption
    let plotScale: PlotScale
}

enum Command {
    case list
    case run(RunningOptions)
    case error(String)
}

class ArgumentsParser {

    func parse(arguments: [String]) -> Command {

        if arguments.count  < 2 {
            return .error("Brak argumentów")
        }

        let command = arguments[1]

        if command == "list" {
            return .list
        }

        if command == "run" {
            var index = 2
            var testNames = [String]()
            var from: Int?
            var to: Int?
            var repetitions: Int?
            var step: Int?
            var export: ExportOption?
            var plotScale: PlotScale?

            while index < arguments.count, !arguments[index].hasPrefix("-") {
                testNames.append(arguments[index])
                index += 1
            }

            while index < arguments.count {
                let option = arguments[index]
                if option == "-n" {
                    let n = Int(arguments[index + 1])!
                    from = n
                    to = n
                    index += 2
                    continue
                }
                if option == "-from" {
                    from = Int(arguments[index + 1])!
                    index += 2
                    continue
                }
                if option == "-to" {
                    to = Int(arguments[index + 1])!
                    index += 2
                    continue
                }
                if option == "-repetitions" {
                    repetitions = Int(arguments[index + 1])!
                    index += 2
                    continue
                }
                if option == "-export" {
                    export = ExportOption(rawValue: arguments[index + 1])
                    index += 2
                    continue
                }

                if option == "-step" {
                    step = Int(arguments[index + 1])!
                    index += 2
                    continue
                }

                if option == "-scale" {
                    plotScale = PlotScale(rawValue: arguments[index + 1])
                    index += 2
                    continue
                }

                return .error("Nieznana opcja: \(arguments[index])")
            }

            if testNames.count == 0 {
                return .error("Brak nazwy testu/testów do uruchoienia")
            }

            if from == nil || to == nil {
                return .error("Brak zakresu danych")
            }

            return .run(
                RunningOptions(
                    tests: testNames,
                    from: from!,
                    to: to!,
                    repetitions: repetitions ?? 1,
                    step: step ?? 1,
                    export: export ?? .terminal,
                    plotScale: plotScale ?? .linear
                )
            )
        }

        return .error("Unknown command: \(command)")
    }
}