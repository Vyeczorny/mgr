//
// Created by Karol on 28.03.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

import Foundation

class AckermannTestSwift: Test {

    private let m: Int64
    private let n: Int64

    init(m: Int64, n: Int64) {
        self.m = m
        self.n = n
    }

    func run() {
        _ = ackermann(m: m, n: n)
    }

    private func ackermann(m: Int64, n: Int64) -> Int64 {
        if m == 0 {
            return n + 1
        } else if m > 0 && n == 0 {
            return ackermann(m: m - 1, n: 1)
        } else {
            return ackermann(m: m - 1, n: ackermann(m: m, n: n - 1))
        }
    }
}
