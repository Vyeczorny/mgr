//
// Created by Karol Wieczorek on 2019-02-13.
// Copyright (c) 2019 Karol Wieczorek. All rights reserved.
//

import Foundation

class SumOfIntegersTestSwift: Test {

    private let numbers: [Int]

    init(n: Int) {
        self.numbers = generateNumbers(n: n)
    }

    func run() {
        _ = computeSum()
    }

    private func computeSum() -> Int64 {
        var sum: Int64 = 0
        for _ in 0..<100 {
            sum += numbers.reduce(Int64(0)) { $0 + Int64($1) }
        }
        return sum
    }
}

private func generateNumbers(n: Int) -> [Int] {
    return (0..<n).map { _ in Int(arc4random()) % 100 }
}
