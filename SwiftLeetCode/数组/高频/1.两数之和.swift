//
//  噶.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/3/30.
// 用hash o(n)
import Foundation
class Solution1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:] // value: index
        for i in 0..<nums.count {
            let value = target - nums[i]
            if let valueIndex = dict[value] {
                return [valueIndex,i]
            } else {
                dict[nums[i]] = i
            }
        }
        return []
    }
    class func test() {
        let nums = [2,7,11,15]
        let target = 9
        let solution = Solution1()
        let result = solution.twoSum(nums, target)
        print(result)
    }
}
