//
// Created by Karol on 05/10/2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

import Foundation

struct MultiplyByTwoStruct {

    private let n: Int

    init(n: Int) {
        self.n = n
    }

    func multiply() -> Int {
        return 2 * n
    }
}
