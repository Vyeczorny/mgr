//
// Created by Karol on 20.08.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    static func generate(size: Int) -> Array<Int> {
        var array = Array<Int>(repeating: 0, count: size)
        for i in 0..<size {
            array[i] = Int(arc4random())
        }
        return array
    }
}