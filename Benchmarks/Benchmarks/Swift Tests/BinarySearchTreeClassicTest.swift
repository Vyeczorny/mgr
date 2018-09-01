//
// Created by Karol on 21.08.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

import Foundation

private class Tree {

    let value: Int
    let left: Tree?
    let right: Tree?

    private init(left: Tree?, value: Int, right: Tree?) {
        self.left = left
        self.value = value
        self.right = right
    }

    func add(element: Int) -> Tree {
        if element == value {
            return self
        } else if element < value {
            if let left = left {
                return Tree(left: left.add(element: element), value: value, right: right)
            } else {
                return Tree(left: Tree(left: nil, value: element, right: nil), value: value, right: right)
            }
        } else {
            if let right = right {
                return Tree(left: left, value: value, right: right.add(element: element))
            } else {
                return Tree(left: left, value: value, right: Tree(left: nil, value: element, right: nil))
            }
        }
    }

    static func buildTree(elements: [Int]) -> Tree {
        return elements.reduce(Tree(left: nil, value: elements[0], right: nil)) { (tree, element) in
            return tree.add(element: element)
        }
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

class BinarySearchTreeClassicTestSwift: Test {

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