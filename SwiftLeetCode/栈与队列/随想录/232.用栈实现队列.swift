//
//  232.用栈实现队列.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/2.
//

import Foundation
// 用栈实现队列
// 使用两个栈实现队列
class MyQueue {
    var stack1: [Int] = []
    var stack2: [Int] = []
    init() {
        
    }
    func push(_ x: Int) {
        stack1.append(x)
    }
    func pop() -> Int {
        peek()
        return stack2.removeLast()
    }
    func peek() -> Int {
        if stack2.isEmpty {
            while !stack1.isEmpty {
                let last = stack1.removeLast()
                stack2.append(last)
            }
        }
        return stack2.last ?? 0
    }
    func empty() -> Bool {
        if stack2.isEmpty && stack1.isEmpty {
            return true
        }
        return false
    }
}


class Solution232 {
    class func test() {
        let queue = MyQueue()
        queue.push(1)
        //        queue.push(2)
        //        print(queue.peek())
        print(queue.pop())
        print(queue.empty())
    }
}
