//
// Created by Karol on 05/10/2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

import Foundation

class StaticDispatchSwift: Test {

    private let inputData: [MultiplyByTwoStruct]

    init(n: Int) {
        self.inputData = Array<Int>.generate(size: n).map(MultiplyByTwoStruct.init)
    }

    func run() {
        inputData.forEach { input in
            _ = input.multiply()
        }
    }
}
