//
// Created by Karol on 05/10/2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

import Foundation

class DynamicDispatchSwift: Test {

    private let inputData: [MultiplyByTwoClass]

    init(n: Int) {
        self.inputData = Array<Int>.generate(size: n).map(MultiplyByTwoClass.init)
    }

    func run() {
        inputData.forEach { input in
            _ = input.multiply()
        }
    }
}
