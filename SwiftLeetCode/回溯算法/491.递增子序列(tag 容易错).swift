//
//  491.递增子序列.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/14.
//

import Foundation
class Solution491 {
    var path: [Int] = []
    var result: [[Int]] = []
    func findSubsequences(_ nums: [Int]) -> [[Int]] {
        subsequence(nums, start: 0 )
        return result
    }
    func subsequence(_ nums: [Int], start: Int) {
        var set = Set<Int>()
        for i in start..<nums.count {
            let num = nums[i]
            // 当前数字比最后的小。
            if let last = path.last, num < last {
                continue
            }
            // 横向去重
            if set.contains(num) {
                continue
            }
            set.insert(num)
            
            path.append(num)
            if path.count >= 2 {
                result.append(path)
            }
            subsequence(nums, start: i + 1)
            path.removeLast()
        }
    }
    class func test() {
        let solution = Solution491()
//        let nums = [4,6,7,7]
        let nums = [1,2,3,4,5,6,7,8,9,10,1,1,1,1,1]
        let result = solution.findSubsequences(nums)
        print(result)
    }
}
