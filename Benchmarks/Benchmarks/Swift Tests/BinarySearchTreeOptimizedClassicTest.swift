//
// Created by Karol on 29.08.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

import Foundation

private class Tree {

    let value: Int
    private(set) var left: Tree?
    private(set) var right: Tree?

    private init(left: Tree?, value: Int, right: Tree?) {
        self.left = left
        self.value = value
        self.right = right
    }

    func add(element: Int) {
        if element == value {
            return
        } else if element < value {
            if let left = left {
                left.add(element: element)
            } else {
                left = Tree(left: nil, value: element, right: nil)
            }
        } else {
            if let right = right {
                right.add(element: element)
            } else {
                right = Tree(left: nil, value: element, right: nil)
            }
        }
    }

    static func buildTree(elements: [Int]) -> Tree {
        let tree = Tree(left: nil, value: elements[0], right: nil)
        elements.forEach(tree.add(element:))
        return tree
    }

    func printDescription() {
        print(description())
    }

    private func description() -> String {
        let leftDescription = left?.description() ?? ""
        let rightDescription = right?.description() ?? ""
        return "<" + leftDescription + String(value) + rightDescription + ">"
    }
}

class BinarySearchTreeOptimizedClassicTestSwift: Test {

    private let n: Int
    private var tree: Tree!

    init(n: Int) {
        self.n = n
    }

    func run() {
        let array = Array<Int>.generate(size: n)
        tree = Tree.buildTree(elements: array)
    }
}