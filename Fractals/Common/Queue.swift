//
//  Queue.swift
//  Fractals
//
//  Created by Jay Lee on 2020/04/21.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import Foundation

struct Queue<Element> {
    /// A queue can store at most `capacity - 1` elements
    let capacity: Int

    private var container: [Element?]

    private var head: Int
    private var tail: Int

    var isEmpty: Bool { head == tail }

    mutating func enqueue(_ newElement: Element) -> Bool {
        if head == 0 && tail == capacity - 1 || head == tail + 1 {
            // The queue is full
            return false
        }
        container[tail] = newElement
        tail = tail == capacity - 1 ? 0 : tail + 1
        return true
    }

    mutating func dequeue() -> Element? {
        if head == tail {
            // The queue is empty
            return nil
        }
        guard let result = container[head] else {
            assertionFailure("container should not be empty as head != tail")
            return nil
        }
        head = head == capacity - 1 ? 0 : head + 1
        return result
    }

    init(_ array: [Element] = [], capacity: Int) {
        precondition(
            capacity > array.count,
            "capacity must be greater than the number of elements in the array"
        )
        self.capacity = capacity
        container = [Element?](repeating: nil, count: capacity)
        for (i, e) in array.enumerated() {
            container[i] = e
        }
        head = 0
        tail = array.count
    }
}
