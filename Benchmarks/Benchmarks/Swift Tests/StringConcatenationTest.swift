//
// Created by Karol Wieczorek on 2019-02-13.
// Copyright (c) 2019 Karol Wieczorek. All rights reserved.
//

import Foundation

class StringConcatenationTestSwift: Test {

    private let n: Int

    init(n: Int) {
        self.n = n
    }

    func run() {
        let hello = "Hello world\n"
        var string = ""

        for _ in 0..<n {
            string += hello
        }
    }
}