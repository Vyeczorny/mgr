//
//  main.swift
//  Benchmarks
//
//  Created by Karol Wieczorek on 18.08.2017.
//  Copyright © 2017 Karol Wieczorek. All rights reserved.
//

import Foundation

private struct AvailableTest {
    let swiftTest: Test
    let objcTest: Test
}

private let availableTests = [
    "array_insertion": AvailableTest(
        swiftTest: ArrayInsertionTestSwift(numberOfInsertions: 100000),
        objcTest: ArrayInsertionTestObjC(numberOfInsertions: 100000)
    )
]

// App

if CommandLine.arguments.count <= 1 {
    print("Brak argumentów")
    exit(-1)
}

let command = CommandLine.arguments[1]

if command == "run" {
    if CommandLine.arguments.count <= 2 {
        print("Brak nazwy testu")
        exit(-1)
    }

    let testName = CommandLine.arguments[2]

    guard let test = availableTests[testName] else {
        print("Test o nazwie \(testName) nie został znaleziony")
        exit(-1)
    }

    test.objcTest.run()
}

if command == "list" {
    for name in availableTests.keys {
        print(name)
    }
}
