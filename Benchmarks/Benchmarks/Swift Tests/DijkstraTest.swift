//
// Created by Karol on 2018-12-08.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

import Foundation

private class GraphElement: QueueElementSwift, CustomStringConvertible {

    var nodeIndex: Int
    var distance: Int
    var alreadyComputed: Bool

    var queueIndex: Int?
    var value: Int { return distance }

    required init() {
        alreadyComputed = false
        nodeIndex = Int(Int32.max)
        distance = Int(Int32.max)
    }

    init(nodeIndex: Int, distance: Int) {
        self.alreadyComputed = false
        self.nodeIndex = nodeIndex
        self.distance = distance
    }

    var description: String {
        return "[\(queueIndex != nil ? String(queueIndex!) : "nil")] \(nodeIndex): \(value)"
    }
}


class DijkstraTestSwift: Test {

    typealias AdjacencyMatrix = [[Int]]
    typealias DistancesArray = [Int]

    private let n: Int
    private let adjacencyMatrix: AdjacencyMatrix

    init(matrix: AdjacencyMatrix) {
        self.n = matrix.count
        self.adjacencyMatrix = matrix
    }

    init(n: Int) {
        self.n = n
        var adjacencyMatrix = AdjacencyMatrix(repeating: Array<Int>(repeating: 0, count: n), count: n)
        for x in 0..<n {
            for y in x..<n {
                if Bool.random() {
                    adjacencyMatrix[x][y] = Int(arc4random()) % 900 + 100
                    adjacencyMatrix[y][x] = adjacencyMatrix[x][y]
                }
            }
        }
        self.adjacencyMatrix = adjacencyMatrix
    }

    func run() {
        _ = dijkstra()
    }

    func dijkstra() -> DistancesArray {

        let n = adjacencyMatrix.count
        var queue = PriorityQueueSwift<GraphElement>(n)
        var nodes = (0..<n).map { GraphElement(nodeIndex: $0, distance: Int(Int32.max)) }

        nodes[0].distance = 0
        nodes[0].alreadyComputed = true
        queue.insert(nodes[0])

        while !queue.isEmpty() {
            let minimumElement = queue.removeMin()
            minimumElement.alreadyComputed = true

            adjacentNodes(to: minimumElement.nodeIndex, from: adjacencyMatrix)
                .map { nodes[$0] }
                .filter { !$0.alreadyComputed }
                .forEach {
                    let relaxedDistance = minimumElement.distance + adjacencyMatrix[minimumElement.nodeIndex][$0.nodeIndex]
                    if $0.queueIndex == nil {
                        queue.insert($0)
                    }
                    if relaxedDistance < $0.distance {
                        $0.distance = relaxedDistance
                        queue.updateDescreasedElement(at: $0.queueIndex!)
                    }
                }
        }

        return nodes.map { $0.distance }
    }

    private func adjacentNodes(to node: Int, from adjacencyMatrix: AdjacencyMatrix) -> [Int] {
        return
            zip((0...adjacencyMatrix.count), adjacencyMatrix[node])
                .filter { $0.1 > 0 }
                .map { $0.0 }
    }
}