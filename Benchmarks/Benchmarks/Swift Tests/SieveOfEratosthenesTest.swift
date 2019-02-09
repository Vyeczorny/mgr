//
// Created by Karol Wieczorek on 2019-02-09.
// Copyright (c) 2019 Karol Wieczorek. All rights reserved.
//

import Foundation

class SieveOfEratosthenesTestSwift: Test {

    private let n: Int

    init(n: Int) {
        self.n = n
    }

    func run() {
        var isPrime = [Bool](repeating: true, count: n)

        for prime in (2..<Int(ceil(sqrt(Double(n))))) {
            for i in (prime + 1)..<n {
                if i % prime == 0 {
                    isPrime[i] = false
                }
            }
        }

//        for i in 0..<n {
//            if (i % 10 == 0) { print("\n") }
//            else { print(isPrime[i] ? " \(i)" : " __", terminator: "") }
//        }
    }
}