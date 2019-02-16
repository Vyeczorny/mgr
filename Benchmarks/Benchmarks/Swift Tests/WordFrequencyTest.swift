//
// Created by Karol Wieczorek on 2019-02-16.
// Copyright (c) 2019 Karol Wieczorek. All rights reserved.
//

import Foundation

class WordFrequencyTestSwift: Test {

    private let data: String

    init(n: Int) {
        self.data = generateData(n: n)
    }

    func run() {
        _ = countWords()
    }

    func countWords() -> [String: Int] {
        var dict = [String: Int]()
        data.split(separator: " ").map(String.init).forEach { word in
            dict[word] = (dict[word] ?? 0) + 1
        }
        return dict
    }
}

private let lorem = [
    "lorem", "ipsum", "dolor", "sit", "amet", "consectetur", "adipiscing", "elit", "proin", "nibh", "augue", "suscipit",
    "a", "scelerisque", "sed", "lacinia", "in", "mi", "cras", "vel", "lorem", "etiam", "pellentesque", "aliquet",
    "tellus", "phasellus", "pharetra", "nulla", "ac", "diam", "quisque", "semper", "justo", "at", "risus", "donec",
    "venenatis", "turpis", "vel", "hendrerit", "interdum", "dui", "ligula", "ultricies", "purus", "sed", "posuere",
    "libero", "dui", "id", "orci", "nam", "congue", "pede", "vitae", "dapibus", "aliquet", "elit", "magna", "vulputate",
    "arcu", "vel", "tempus", "metus", "leo", "non", "est", "etiam", "sit", "amet", "lectus", "quis", "est", "congue",
    "mollis", "phasellus", "congue", "lacus", "eget", "neque", "phasellus", "ornare", "ante", "vitae", "consectetuer",
    "consequat", "purus", "sapien", "ultricies", "dolor", "et", "mollis", "pede", "metus", "eget", "nisi", "praesent",
    "sodales", "velit", "quis", "augue", "cras", "suscipit", "urna", "at", "aliquam", "rhoncus", "urna", "quam",
    "viverra", "nisi", "in", "interdum", "massa", "nibh", "nec", "erat"
]

private func generateData(n: Int) -> String {
    return (0..<n).map { _ in lorem[Int(arc4random()) % lorem.count] }.joined(separator: " ")
}