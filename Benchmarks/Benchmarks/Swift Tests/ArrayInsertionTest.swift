//
//  ArrayInsertionTest.swift
//  Benchmarks
//
//  Created by Karol Wieczorek on 21.08.2017.
//  Copyright © 2017 Karol Wieczorek. All rights reserved.
//

import Foundation

class ArrayInsertionTestSwift: Test {

    private let numberOfInsertions: Int

    init(numberOfInsertions: Int) {
        self.numberOfInsertions = numberOfInsertions
    }

    func run() {
        var array = [Int]()

        for i in 0..<numberOfInsertions {
            array.append(i)
        }
    }
}
