//
//  40.组合总和II.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/14.
//
// 有重复的元素，就必须的排序
// 有几个比较关键的点
// 1. 每个数字在每个组合中只出现一次
// 2. 因为有重复的数字，
import Foundation
class Solution40 {
    var path: [Int] = []
    var result: [[Int]] = []
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        // 有重复元素时必须排序
        let candidates = candidates.sorted()
        combination(candidates, target: target, start: 0)
        return result
    }
    func combination(_ candidates: [Int],  target: Int, start: Int) {
        var pre: Int?
        for i in start..<candidates.count {
            
            let candidate = candidates[i]
            // 在每一层，出现相同的直接跳过
            if let pre = pre, pre == candidate {
                continue
            }
            pre = candidate
           
            let target = target - candidate
          
            if target == 0 {
                path.append(candidate)
                result.append(path)
                path.removeLast()
                return
            } else if target < 0 {
                path.removeLast()
                return
            }
            // start: i + 1 在不组合上只能使用一次。
            combination(candidates, target: target, start: i + 1)
            path.removeLast()
        }
    }
    class func test() {
        let solution = Solution40()
        let candidates = [10,1,2,7,6,1,5], target = 8
        let result = solution.combinationSum2(candidates,target)
        print(result)
    }
}
    
