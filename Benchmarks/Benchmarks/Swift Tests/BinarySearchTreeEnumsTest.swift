//
// Created by Karol on 20.08.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

import Foundation

private indirect enum Tree {
    case empty
    case node(Tree, Int, Tree)

    static func buildTree(elements: [Int]) -> Tree {
        return elements.reduce(Tree.empty) { (tree, element) in tree.add(element: element) }
    }

    func add(element: Int) -> Tree {
        switch self {
        case .empty:
            return .node(.empty, element, .empty)
        case .node(let left, let value, let right):
            if element == value {
                return self
            } else if value > element {
                return .node(left.add(element: element), value, right)
            } else {
                return .node(left, value, right.add(element: element))
            }
        }
    }

    func printDescription() {
        print(description())
    }

    private func description() -> String {
        switch self {
        case .empty:
            return ""
        case .node(let left, let value, let right):
            return "<" + left.description() + String(value) + right.description() + ">"
        }
    }
}

class BinarySearchTreeEnumsTestSwift: Test {

    private let n: Int
    private var tree: Tree!

    init(n: Int) {
        self.n = n
    }

    func run() {
        let array = Array<Int>.generate(size: n)
        self.tree = Tree.buildTree(elements: array)
    }
}