//
//  37. 解数独.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/19.
//
// 数独也是不断的去尝试，不合适就撤销。所以回溯算法。
import Foundation
class Solution37 {
    func solveSudoku(_ board: inout [[Character]]) {
        backsource(&board, row: 0)
    }
    func backsource(_ board: inout [[Character]], row: Int) {
        if row >= board.count {
            print(board)
            return
        }
        // 遍历列
        for i in 0..<board.count {
            if board[row][i] != "." {
                continue
            }
            // 从1到9去尝试填写
            for value in 1...9 {
                let value = Character(String(value))
                if !isValid(&board, row: row, col: i, value: value) {
                    continue
                }
                board[row][i] = value
                backsource(&board, row: i + 1)
                board[row][i] = "."
            }
        }
    }
    func isValid(_ board: inout [[Character]], row: Int, col: Int, value: Character) -> Bool {
        // 1. 在每一列上只出现一次
        // 2. 以3 * 3的小方块满足条件
        
        // 每行不能出现相同
        for i in 0..<board.count {
            if board[row][i] == value {
                return false
            }
        }
        
        // 每列只能出现一次
        for i in 0..<board.count {
            if board[i][col] == value {
                return false
            }
        }
        // 以3 * 3的小方块满足条件
        let leftStart = (col / 3) * 3
        let topStart = (row / 3) * 3
        for i in leftStart..<leftStart + 3 {
            for j in topStart..<topStart + 3 {
                if board[i][j] == value {
                    return false
                }
            }
        }
        return true
    }
    class func test() {
        let solution = Solution37()
        var board: [[Character]] = [
            ["5","3",".",".","7",".",".",".","."],
            ["6",".",".","1","9","5",".",".","."],
            [".","9","8",".",".",".",".","6","."],
            ["8",".",".",".","6",".",".",".","3"],
            ["4",".",".","8",".","3",".",".","1"],
            ["7",".",".",".","2",".",".",".","6"],
            [".","6",".",".",".",".","2","8","."],
            [".",".",".","4","1","9",".",".","5"],
            [".",".",".",".","8",".",".","7","9"]]
        
        solution.solveSudoku(&board)
    }
}
