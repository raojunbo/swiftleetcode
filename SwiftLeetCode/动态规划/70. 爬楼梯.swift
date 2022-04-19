//
//  70. 爬楼梯.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/19.
//
// 爬楼梯

// f(0) = 0
// f(1) = 1
// f(2) = 2
// f(n) = f(n - 1) + f(n - 2)
import Foundation
class Solution70 {
    func climbStairs(_ n: Int) -> Int {
        if n <= 2 {
            return n
        }
        var p = 1
        var q = 2
        var r = 0
        for _ in 3...n {
            r = p + q
            p = q
            q = r
        }
        return r
    }
    class func test() {
        let solution = Solution70()
        let result = solution.climbStairs(3)
        print(result)
    }
}
