//
//  209. 长度最小的子数组.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/3/30.
//
// 这个题实际上是滑动窗口
//
import Foundation
class Solution209 {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var left = 0
        var sum = 0
        var result = Int.max
        for right in 0..<nums.count {
            sum += nums[right]
            while sum >= target {
                result = min(result, right - left + 1)
                sum -= nums[left]
                left += 1
            }
        }
        return result == Int.max ? 0: result
    }
    class func test() {
        let solution = Solution209();
        let nums = [1,4,4]
        let target = 4
        let result = solution.minSubArrayLen(target, nums)
        print(result)
    }
}
