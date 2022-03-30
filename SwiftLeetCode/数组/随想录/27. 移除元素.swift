//
//  27. 移除元素.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/3/30.
//
/**
 原地移除所有数值等于val的元素
 [-1,0,3,5,9,12,9]
 */
import Foundation
class Solution27 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var cur = 0
        var left = 0
        while cur < nums.count {
            if nums[cur] != val {
                nums[left] = nums[cur]
                left += 1
            }
            cur += 1
        }
        return left
    }
    class func test() {
        let solution = Solution27();
        var nums = [-1,0,3,5,9,12]
        solution.removeElement(&nums, 9)
        print(nums)
    }
}
