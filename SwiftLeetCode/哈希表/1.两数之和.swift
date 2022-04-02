//
//  噶.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/3/30.
// 变换表达式
// Hash减少一层循环
import Foundation
class Solution1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int: Int] = [:] // value: index
        for i in 0..<nums.count {
            let value = target - nums[i]
            if let valueIndex = map[value] {
                return [valueIndex,i]
            } else {
                map[nums[i]] = i
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
