//
//  39. 组合总和.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/14.
//
import Foundation
class Solution39 {
    var path: [Int] = []
    var result: [[Int]] = []
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let candidates = candidates.sorted()
        combination(candidates, target: target, start: 0)
        return result
    }
    func combination(_ candidates: [Int], target: Int, start: Int) {
        for i in start..<candidates.count {
            let value = candidates[i]
            path.append(value)
            let target = target - candidates[i]
            if target < 0 {
                path.removeLast()
                return
            } else if target == 0 {
                result.append(path)
                path.removeLast()
                return
            }
            // start: i 表示不同层能使用多次
            combination(candidates, target: target, start: i)
            path.removeLast()
        }
    }
    class func test() {
        let solution = Solution39()
        let candidates = [2,7,6,3,5,1], target = 9
        let result = solution.combinationSum(candidates, target)
        print(result)
    }
}
