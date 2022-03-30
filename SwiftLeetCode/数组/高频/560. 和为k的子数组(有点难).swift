//
//  560. 和为k的子数组.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/3/30.
//
// 和为k的子数组
// 求的是子数组，是数组。
//

import Foundation
class Solution560 {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var result: Int = 0
        var presum: [Int: Int] = [:]
        var sum: Int = 0
        
        for i in 0 ..< nums.count {
            sum += nums[i]
            if sum == k {
                result += 1
            }
            if let count = presum[sum - k] {
                result += count
            }
            presum[sum, default: 0] += 1
        }
        return result
    }
    class func test() {
        let solution = Solution560()
        let nums = [1,1,1]
        let k = 2
        let result = solution.subarraySum(nums, k)
        print(result)
    }
}
