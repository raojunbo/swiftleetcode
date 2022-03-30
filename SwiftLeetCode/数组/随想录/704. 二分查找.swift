//
//  704 二分查找.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/3/30.
//

import Foundation

/*
 思路
 数组是有序的。在由序数组中寻找指定值的下标。因为数组是有序的所以可以采用二分查找法。
 
 */
class Solution704 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
           let mid = (left + right)
            if target == nums[mid] {
                return mid
            } else if target < nums[mid] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return -1
    }
    class func test() {
        let solution = Solution704();
        let nums = [-1,0,3,5,9,12]
        let result = solution.search(nums, 9)
        print(result)
    }

}
