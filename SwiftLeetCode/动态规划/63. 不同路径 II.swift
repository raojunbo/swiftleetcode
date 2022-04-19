//
//  63. 不同路径 II.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/19.
//
// 这个是由障碍的路径
import Foundation
class Solution63 {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let rowCount = obstacleGrid.count
        let colCount = obstacleGrid[0].count
        var dp = Array(repeating: Array(repeating: 0, count: colCount), count: rowCount)
        var obstacle = false
        for i in 0..<colCount {
            if obstacleGrid[0][i] == 1 ||  obstacle  {
                dp[0][i] = 0
                obstacle = true
            } else {
                dp[0][i] = 1
            }
        }
        obstacle = false
        for i in 0..<rowCount {
            if obstacleGrid[i][0] == 1 ||  obstacle  {
                dp[i][0] = 0
                obstacle = true
            } else {
                dp[i][0] = 1
            }
        }
        for i in 1..<rowCount {
            for j in 1..<colCount {
                if obstacleGrid[i][j] == 1 {
                    dp[i][j] = 0
                } else {
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
                }
            }
        }
        return dp[rowCount - 1][colCount - 1]
    }
    class func test() {
        let solution = Solution63()
        let obstacleGrid =  [[0,0]]
//        [[0,0,0],[0,1,0],[0,0,0]]
        let result = solution.uniquePathsWithObstacles(obstacleGrid)
        print(result)
    }
}
