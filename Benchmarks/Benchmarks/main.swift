//
//  main.swift
//  Benchmarks
//
//  Created by Karol Wieczorek on 18.08.2017.
//  Copyright © 2017 Karol Wieczorek. All rights reserved.
//

import Foundation

class DijkstraChecker {

    func check() {
        let n = 100
        var i = 0

        while true {
            print("Test run no. \(i)")

            let swiftMatrix = randomMatrix(n: n)
            let objcMatrix = matrixToObjC(matrix: swiftMatrix)

            let swiftTest = DijkstraOptimizedTestSwift(matrix: swiftMatrix)
            let objcTest = DijkstraOptimizedTestObjC(adjacencyMatrix: objcMatrix)

            let swiftResult = swiftTest.dijkstra()
            let objcResult = objcTest.dijkstra().map { $0.intValue }


            if swiftResult != objcResult {
                print("--- ERROR ---")
                print("Adjacency matrix: \(swiftMatrix)")
                print("Swift result: \(swiftResult)")
                print("ObjC result: \(objcResult)")
                print("Results are equal: \(swiftResult == objcResult)")
                break
            } else {
                i += 1
            }
        }
    }

    func randomMatrix(n: Int) -> DijkstraTestSwift.AdjacencyMatrix {
        var matrix = DijkstraTestSwift.AdjacencyMatrix(repeating: Array<Int>(repeating: 0, count: n), count: n)
        for x in 0..<n {
            for y in (x+1)..<n {
                if Bool.random() {
                    matrix[x][y] = Int(arc4random()) % 900 + 100
                    matrix[y][x] = matrix[x][y]
                }
            }
        }
        return matrix
    }

    func matrixToObjC(matrix: DijkstraTestSwift.AdjacencyMatrix) -> [[NSNumber]] {
        return matrix.map { row in
            return row.map(NSNumber.init)
        }
    }
}


// REAL PART

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
case .check:
    DijkstraChecker().check()
}