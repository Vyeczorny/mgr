//
//  ArrayInsertionTest.swift
//  Benchmarks
//
//  Created by Karol Wieczorek on 21.08.2017.
//  Copyright © 2017 Karol Wieczorek. All rights reserved.
//

import Foundation

class ArrayInsertionTestSwift: Test {

    private let n: Int

    init(n: Int) {
        self.n = n
    }

    func run() {
        var array = [Int]()

        for i in 0..<n {
            array.append(i)
        }
    }
}
