//
// Created by Karol on 05/10/2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

import Foundation

class StaticDispatchTestSwift: Test {

    private let inputData: [MultiplyByTwoStruct]

    init(n: Int) {
        self.inputData = Array<Int>.generate(size: n).map(MultiplyByTwoStruct.init)
    }

    func run() {
        var output = 0
        inputData.forEach { input in
            output = output &+ input.multiply()
        }
    }
}
