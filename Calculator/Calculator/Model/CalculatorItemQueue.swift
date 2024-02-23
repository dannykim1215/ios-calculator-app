//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by H on 2/20/24.
//

struct CalculatorItemQueue<T: CalculateItem> {
    private var inBox: [T] = []
    private var outBox: [T] = []
    
    var size: Int {
        return inBox.count + outBox.count
    }
    
    var isEmpty: Bool {
        return inBox.isEmpty && outBox.isEmpty
    }
    
    var queue: [T] {
        return inBox + outBox.reversed()
    }
    
    var first: T? {
        return inBox.isEmpty ? outBox.last : inBox.first
    }
    
    var last: T? {
        return outBox.isEmpty ? inBox.last : outBox.first
    }
    
    mutating func push(_ newElement: T) { // enqueue
        inBox.append(newElement)
    }
    
    mutating func pop() -> T? { // dequeue
        if outBox.isEmpty {
            outBox = inBox.reversed()
            inBox.removeAll()
        }
        
        return outBox.popLast()
    }
    
    mutating func front() -> T? {
        if outBox.isEmpty {
            outBox = inBox.reversed()
            inBox.removeAll()
        }
        
        return outBox.last
    }
    
    mutating func rear() -> T? {
        if inBox.isEmpty {
            return outBox.first
        }
        
        return inBox.last
    }
}
