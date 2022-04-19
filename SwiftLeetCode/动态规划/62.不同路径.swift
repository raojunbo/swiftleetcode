//
//  62.不同路径.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/19.
//
// 采用动态规划
// 定义dp[i][j] 为达到该位置的路径数目
import Foundation
class Solution62 {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        let row = Array(repeating: 0, count: n)
        var dp = Array(repeating: row, count: m)
        // 初始化值
        for j in 0..<n {
            dp[0][j] = 1
        }
        for i in 0..<m {
            dp[i][0] = 1
        }
        // 递归表达式
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
            }
        }
        return dp[m - 1][n - 1]
    }
    class func test() {
        let solution = Solution62()
        let m = 3, n = 7
        let result = solution.uniquePaths(m, n)
        print(result)
    }
}
