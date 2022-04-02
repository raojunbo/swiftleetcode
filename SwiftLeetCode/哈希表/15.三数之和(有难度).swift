//
//  15.三数之和.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/3/30.
//
// a + b + c = 0
// a + b = -c
// 转换成a+b = 0
// 三数之和能不能减一层循环
import Foundation
class Solution15 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
//        var dict: [Int: [Int]] = [:]
//        for i in 0..<nums.count {
//            if var array = dict[nums[i]] {
//                array.append(i)
//                dict[nums[i]] = array
//            } else {
//                dict[nums[i]] = [i]
//            }
//        }
//        for i in 0..<nums.count {
//            for j in (i + 1)..<nums.count {
//                let target = nums[i] + nums[j]
//                if let array = dict[-target] {
//                    for index in array {
//                        if index != i && index != j {
//                            result.append([i, j, index])
//                        }
//                    }
//
//                }
//            }
//        }
        return result
    }
    class func test() {
        let solution = Solution15()
        let nums = [-1,0,1,2,-1,-4]
        // -1 ,0, 1
        // -1, -1, 2
        let result = solution.threeSum(nums)
        print(result)
    }
}
