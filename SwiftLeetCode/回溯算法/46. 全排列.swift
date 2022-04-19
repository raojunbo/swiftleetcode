//
//  46. 全排列.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/18.
//
import Foundation

class Solution46 {
    // used[1] 纵向上已经使用改过
    var path: [Int] = []
    var used: [Int] = []
    var result: [[Int]] = []
    func permute(_ nums: [Int]) -> [[Int]] {
        used = Array(repeating: 0, count: nums.count)
        bactrace(nums)
        return result
    }
    func bactrace(_ nums: [Int]) {
        if path.count == nums.count {
            result.append(path)
            return
        }
        for i in 0..<nums.count {
            if used[i] == 1 {
                continue
            }
            used[i] = 1
            path.append(nums[i])
            bactrace(nums)
            path.removeLast()
            used[i] = 0
        }
    }
    class func test() {
        let solution = Solution46()
        let nums = [1,2,3]
        let result = solution.permute(nums)
        print(result)
    }
}
