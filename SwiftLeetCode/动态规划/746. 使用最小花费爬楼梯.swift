//
//  746. 使用最小花费爬楼梯.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/19.
//
// 使用最少花费爬楼梯
// 最后的花费是f(n) = min(f(n - 1), f(n - 2))
// 定义
import Foundation
class Solution746 {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        // 定义dp[i] 为爬上i阶所需要的最小开销。
        var dp = Array(repeating: 0, count: cost.count + 1)
        dp[0] = 0
        dp[1] = 0
        for i in 2...cost.count {
            dp[i] = min(dp[i - 1] + cost[i - 1], dp[i - 2] + cost[i - 2])
        }
        return dp[cost.count]
    }
    class func test() {
        let solution = Solution746()
        let cost = [10,15,20]
        let result = solution.minCostClimbingStairs(cost)
        print(result)
    }
}
