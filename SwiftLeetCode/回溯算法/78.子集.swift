//
//  78.子集.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/14.
//
// 回溯法解法
import Foundation
class Solution78 {
    var path: [Int] = []
    var result: [[Int]] = [[]]
    func subsets(_ nums: [Int]) -> [[Int]] {
        sub(nums, start: 0)
        return result
    }
    func sub(_ nums: [Int], start: Int) {
        for i in start..<nums.count {
            path.append(nums[i])
            result.append(path)
            sub(nums, start: i + 1)
            path.removeLast()
        }
    }
    class func test() {
        let solution = Solution78()
        let nums = [1, 2, 3]
        let result = solution.subsets(nums)
        print(result)
    }
}
