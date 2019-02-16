//
// Created by Karol Wieczorek on 2019-02-16.
// Copyright (c) 2019 Karol Wieczorek. All rights reserved.
//

import Foundation

class RC4TestSwift: Test {

    private let n: Int
    private let key: String = "SecretKey"
    private let data: String

    init(n: Int) {
        self.n = n
        self.data = generateData(n: n)
    }

    func run() {
        _ = cipherText()
    }

    func cipherText() -> [UInt8] {
        let asciiKey = Array<UInt8>(key.utf8)
        let asciiText = Array<UInt8>(data.utf8)

        let S = createSArray(key: asciiKey)
        return cipherText(S: S, text: asciiText)
    }

    func createSArray(key: [UInt8]) -> [UInt8] {
        var S = Array<UInt8>(0...255)

        var j: UInt8 = 0
        for i in 0...255 {
            j = j &+ S[i] &+ key[i % key.count]
            S.swapAt(i, Int(j))
        }

        return S
    }

    func cipherText(S: [UInt8], text: [UInt8]) -> [UInt8] {
        var S = S
        var output = [UInt8]()
        var i: UInt8 = 0
        var j: UInt8 = 0

        return text.map { char in
            i = i &+ 1
            j = j &+ S[i.int]
            S.swapAt(i.int, j.int)

            let x = S[(S[i.int] &+ S[j.int]).int]
            return char ^ x
        }
    }

    func printInHex(array: [UInt8]) {
        print(array.map { String(format: "%02X", $0) }.joined(separator: " "))
    }
}

private extension UInt8 {
    var int: Int {
        return Int(self)
    }
}

private func generateData(n: Int) -> String {
    let chars = ["a", "b", "c", " d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
                 "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N",
                 "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", " "
    ]

    return (0..<n).map { _ in chars[Int(arc4random()) % chars.count] }.joined()
}