//
// Created by Karol Wieczorek on 2019-02-09.
// Copyright (c) 2019 Karol Wieczorek. All rights reserved.
//

import Foundation

let RGB_R = 0
let RGB_G = 1
let RGB_B = 2

class RGBHistogramTestSwift: Test {

    private let n: Int
    private let data: [[UInt8]]

    init(n: Int) {
        self.n = n
        self.data = generateData(n: n)
    }

    func run() {
        var histogram = [[Int]](repeating: [Int](repeating: 0, count: 256), count: 3)

        for element in data {
            histogram[RGB_R][Int(element[RGB_R])] += 1
            histogram[RGB_G][Int(element[RGB_G])] += 1
            histogram[RGB_B][Int(element[RGB_B])] += 1
        }
    }
}

private func generateData(n: Int) -> [[UInt8]] {
    return (0..<n).map { _ in
        return [UInt8(arc4random() % 256), UInt8(arc4random() % 256), UInt8(arc4random() % 256)]
    }
}