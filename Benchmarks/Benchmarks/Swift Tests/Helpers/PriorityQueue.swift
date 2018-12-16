//
// Created by Karol on 2018-12-08.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

import Foundation

protocol QueueElementSwift: class {
    var queueIndex: Int? { get set }
    var value: Int { get }

    init()
}

struct PriorityQueueSwift<Element: QueueElementSwift> {

    private var array: [Element]
    private var size: Int {
        return array.count
    }

    init(_ n: Int) {
        array = Array<Element>()
    }

    func isEmpty() -> Bool {
        return size == 0
    }

    mutating func insert(_ element: Element) {
        array.append(element)
        element.queueIndex = size - 1
        moveToTop(at: size - 1)
    }

    mutating func updateDescreasedElement(at index: Int) {
        moveToTop(at: index)
    }


    mutating func removeMin() -> Element {
        if size == 1 {
            // there is only one element, so we just return it
            return array.popLast()!
        } else {
            let min = array[0]
            array[0] = array.popLast()!
            array[0].queueIndex = 0
            heapify(0)
            return min
        }
    }

    private mutating func moveToTop(at index: Int) {
        guard index > 0 else { return }

        let index = index
        let parentIndex = (index + 1) / 2 - 1

        let element = array[index]
        let parentElement = array[parentIndex]

        if element.value < parentElement.value {
            // swaping elements in array
            array.swapAt(index, parentIndex)

            // swaping indexes in elements
            element.queueIndex = parentIndex
            parentElement.queueIndex = index

            // move to next step
            moveToTop(at: parentIndex)
        }
    }

    private mutating func heapify(_ index: Int) {
        let index = index
        let leftIndex = (index + 1) * 2 - 1
        let rightIndex = (index + 1) * 2

        var smallestIndex = index
        if leftIndex < size && array[leftIndex].value < array[smallestIndex].value {
            smallestIndex = leftIndex
        }
        if rightIndex < size && array[rightIndex].value < array[smallestIndex].value {
            smallestIndex = rightIndex
        }

        if smallestIndex != index {
            // swap elements
            array.swapAt(index, smallestIndex)

            // swap indexes in elements
            array[index].queueIndex = index
            array[smallestIndex].queueIndex = smallestIndex

            heapify(smallestIndex)
        }
    }

    var description: String {
        return array.description
    }
}