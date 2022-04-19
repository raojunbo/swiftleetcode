//
//  第51题. N皇后.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/19.
//
// n皇后，实际上是回溯法。
// 将行遍历用递归替代
import Foundation
class Solution51 {
    var result: [[String]] = []
    func solveNQueens(_ n: Int) -> [[String]] {
        let lineArray = Array(repeating: ".", count: n)
        var array = Array(repeating: lineArray, count: n)
        attemp(&array, n: n, row: 0, col: 0)
        return result
    }
    func attemp(_ array: inout [[String]], n: Int, row: Int, col: Int) {
        // 当已经找到下一行时，已经存在一个
        if row == n {
            var rowArray: [String] = []
            for item in array {
                rowArray.append(item.joined())
            }
            result.append(rowArray)
            return
        }
        for j in 0..<n {
            // 如果无效
            if !isValidate(&array, n: n, row: row, col: j) {
                continue
            }
            array[row][j] = "Q"
            attemp(&array, n: n, row: row + 1, col: col)
            array[row][j] = "."
        }
    }
    func isValidate(_ array: inout [[String]], n: Int,row: Int, col: Int) -> Bool {
        // 列上有效
        for i in 0..<row {
            if array[i][col] == "Q" {
                return false
            }
        }
        // 从左上角到右下角
        var i = row - 1
        var j = col - 1
        while i >= 0, j >= 0 {
            if array[i][j] == "Q" {
                return false
            }
            i -= 1
            j -= 1
        }
        // 从左下角到右上角
        i = row - 1
        j = col + 1
        while i >= 0, j < n {
            if array[i][j] == "Q" {
                return false
            }
            i -= 1
            j += 1
        }
        return true
    }
    class func test() {
        let solution = Solution51()
        let n = 4
        let result = solution.solveNQueens(n)
        print(result)
    }
}
