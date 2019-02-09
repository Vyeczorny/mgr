//
// Created by Karol on 05/10/2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

import Foundation

class DynamicDispatchTestSwift: Test {

    private let items: [MultiplyByTwoProtocol]

    init(n: Int) {
        self.items = Array<Int>.generate(size: n).map(MultiplyByTwoStruct.init)
    }

    func run() {
        var output = 0
        for input in items {
            output = output &+ input.multiply()
        }
    }
}
