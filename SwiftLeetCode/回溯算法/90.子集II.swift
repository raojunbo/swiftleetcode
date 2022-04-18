//
//  90.子集II.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/14.
//
// 因为有重复元素，所以只需要横向去重就可以。
// 横向去重都得排序
import Foundation
class Solution90 {
    var part: [Int] = []
    var result: [[Int]] = [[]]
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        sub(nums, start: 0 )
        return result
    }
    func sub(_ nums: [Int], start: Int) {
        var pre: Int?
        for i in start..<nums.count {
            // 横向去重
            if let tmpPre = pre, nums[i] == tmpPre {
                continue
            }
            part.append(nums[i])
            pre = nums[i]
            result.append(part)
            sub(nums, start: i + 1)
            part.removeLast()
        }
    }
    class func test() {
        let solution = Solution90()
        let nums = [1,2,2]
        let result = solution.subsetsWithDup(nums)
        print(result)
    }
}
