//
// Created by Karol on 28.05.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

import Foundation

class BubbleSortTestSwift: Test {

    private let n: Int

    init(n: Int) {
        self.n = n
    }

    func run() {
        let array = Array<Int>.generate(size: n)

        _ = bubbleSort(array)
    }

    func bubbleSort(_ array: [Int]) -> [Int] {
        var array = array
        for i in 0..<array.count-1 {
            for j in 1..<array.count-i {
                if array[j] < array[j-1] {
                    let temp = array[j]
                    array[j] = array[j-1]
                    array[j-1] = temp
                }
            }
        }
        return array
    }
}
