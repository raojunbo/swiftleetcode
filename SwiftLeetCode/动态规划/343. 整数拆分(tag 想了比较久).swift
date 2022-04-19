//
//  343. 整数拆分.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/19.
//
// 采用动态规划算法。
// dp[i] 数字为i的拆分后的最大数字

import Foundation

class Solution343 {
    
    func integerBreak(_ n: Int) -> Int {
        var dp = Array(repeating: Int.min, count: n + 1)
        dp[1] = 1
        for i in 1...n {
            for j in 1..<i {
                // 将初始值，当前计算的最大值，
                dp[i] = max(dp[i], j * (i - j), dp[i - j] * j)
            }
        }
        return dp[n]
    }
    
    
    class func test() {
        let solution = Solution343()
        let n = 10
        let result = solution.integerBreak(n)
        print(result)
    }
}
