//
//  977.有序数组的平方.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/3/30.
//
// 只需要比较两边就可以了
import Foundation
class Solution977 {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var i = 0
        var j = nums.count - 1
        var k = nums.count - 1
        var result = Array(repeating: 0, count: nums.count)
        for _ in 0..<nums.count {
            if nums[i] * nums[i] < nums[j] * nums[j] {
                result[k] = nums[j] * nums[j]
                j -= 1
            } else {
                result[k] = nums[i] * nums[i]
                i += 1
            }
            k -= 1
        }
        return result
    }
    class func test() {
        let solution = Solution977();
        let nums = [-4,-1,0,3,10]
        var result = solution.sortedSquares(nums)
        print(result)
    }
}
