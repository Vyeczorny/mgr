//
// Created by Karol on 28.03.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

import Foundation

class FibonacciTestSwift: Test {

    private let n: Int

    init(n: Int) {
        self.n = n
    }

    func run() {
        _ = fibonacci(n: n)
    }

    private func fibonacci(n: Int) -> Int64 {
        if n == 0 {
            return 0
        } else if n == 1 {
            return 1
        } else {
            return fibonacci(n: n - 1) + fibonacci(n: n - 2)
        }
    }
}
