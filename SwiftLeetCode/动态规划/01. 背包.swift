//
//  01 背包.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/20.
//
// dp[i][j] 表示从下标为[0-i]的物品里任意取，放进容量为j的背包，价值总和最大是多少。
// 递归表达式的关键是，要这件物品还是不要这件物品
// dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - weight[i]] + value[i])
import Foundation

class Solution01 {
    func bagValue(capacity: Int, weight: [Int], value:[Int]) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: capacity + 1), count: weight.count + 1)
        for i in 1...weight.count {
            for j in 1...capacity {
                // 1. 使用当前物品
                // 2. 不使用当前物品
                if j - weight[i - 1] < 0 {
                    dp[i][j] = dp[i - 1][j]
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - weight[i - 1]] + value[i - 1])
                }
            }
        }
        return dp[weight.count][capacity]
    }
//     优化。递推公式，只用到了二维数据的上一行数据。所以可以将二维数组该成一维数组
    func bagValue2(capacity: Int, weight: [Int], value:[Int]) -> Int {
        var dp = Array(repeating: 0, count: capacity + 1)
        for i in 1...weight.count {
            for j in (1...capacity).reversed() {
                if j - weight[i - 1] >= 0 {
                    dp[j] = max(dp[j], dp[j - weight[i - 1]] + value[i - 1])
                }
            }
        }
        return dp[capacity]
    }
    class func test() {
        let weight = [1, 3, 4]
        let value = [15, 20, 30]
        let solution = Solution01()
        let result = solution.bagValue2(capacity: 4, weight: weight, value: value)
        print(result)
    }
}
