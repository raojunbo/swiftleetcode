//
//  96.不同的二叉搜索树.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/19.
//
// 不同的二叉搜索树种数
// dp[i] += dp[j - 1] * dp[i - j]
import Foundation
class Solution96 {
    func numTrees(_ n: Int) -> Int {
        var dp  = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        for i in 1...n {
            for j in 1...i {
                dp[i] += dp[j - 1] * dp[i - j];
            }
        }
        return dp[n];
    }
    class func test() {
        let solution = Solution96()
        let result = solution.numTrees(3)
        print(result)
    }
}
