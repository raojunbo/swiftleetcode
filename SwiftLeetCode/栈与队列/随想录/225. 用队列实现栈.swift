//
//  225. 用队列实现栈.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/2.
//
// 用队列实现栈，先进后出
//
import Foundation
class MyStack {
    var queue1: [Int] = []
    var queue2: [Int] = []
    
    init() {
        
    }
    func push(_ x: Int) {
        queue1.append(x)
    }
    func pop() -> Int {
        top()
        return queue2.removeLast()
    }
    func top() -> Int {
        while !queue1.isEmpty {
            let item = queue1.removeFirst()
            queue2.append(item)
        }
        return queue2.last ?? 0
    }
    func empty() -> Bool {
        if queue1.isEmpty && queue2.isEmpty {
            return true
        }
        return false
    }
}

class Solution225 {
    class func test() {
        let stack = MyStack()
        stack.push(1)
        stack.push(2)
        print(stack.top())
        print(stack.pop())
        print(stack.empty())
    }
}
