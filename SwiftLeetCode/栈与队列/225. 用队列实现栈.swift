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
        // 1. push时，谁为空加入谁
    }
    func pop() -> Int {
        // 出栈，谁不为空将他转入另一个队列。
        //
        return 1
    }
    func top() -> Int {
        // 1. 将queue1的全入队queue2
        return 1
    }
    func empty() -> Bool {
        return true
    }
}

class Solution225 {
    class func test() {
        let queue = MyQueue()
        queue.push(1)
        //        queue.push(2)
        //        print(queue.peek())
        print(queue.pop())
        print(queue.empty())
    }
}
