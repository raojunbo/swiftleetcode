//
//  509. 斐波那契数.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/19.
//
// f(0) = 0
// f(1) = 1
// f(n) = f(n - 1) + f(n - 2)
import Foundation
class Solution509 {
    func fib(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }
        var fn2: Int = 0
        var fn1: Int = 1
        var result = 0
        for _ in 2...n {
            result = fn2 + fn1
            fn2 = fn1
            fn1 = result
        }
        return result
    }
    class func test() {
        let solution = Solution509()
        let result = solution.fib(3)
        print(result)
    }
}
