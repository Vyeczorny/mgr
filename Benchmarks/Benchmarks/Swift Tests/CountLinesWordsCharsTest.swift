//
// Created by Karol Wieczorek on 2019-02-10.
// Copyright (c) 2019 Karol Wieczorek. All rights reserved.
//

import Foundation

class CountLinesWordsCharsTestSwift: Test {

    private let data: String

    init(n: Int) {
        self.data = generateData(n: n)
    }

    func run() {
        var chars = data.count
        var words = 0
        var lines = 0

        var isInWord = false

        for c in data {
            if c == "\n" {
                lines += 1
            }

            if (c != "\n") && (c != "\t") && (c != " ") {
                isInWord = true
            } else if (isInWord) {
                words += 1
                isInWord = false
            }
        }
    }
}

private func generateData(n: Int) -> String {
    let chars = ["a", "b", "c", " d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
                 "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N",
                 "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "\t", "\n", " "
    ]

    return (0..<n).map { _ in chars[Int(arc4random()) % chars.count] }.joined()
}