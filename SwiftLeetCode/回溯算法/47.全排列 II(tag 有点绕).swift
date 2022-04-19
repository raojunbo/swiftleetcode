//
//  47.全排列 II.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/19.
//
// 可包含重复数组的全排列
// 必须采用排序
import Foundation
class Solution47 {
    var path: [Int] = []
    var result: [[Int]] = []
    var used: [Bool] = []
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        used = Array(repeating: false, count: nums.count)
        let sortNums = nums.sorted()
        backtrance(sortNums)
        return result
    }
    func backtrance(_ nums: [Int]) {
        if nums.count == path.count {
            result.append(path)
            return
        }
        for i in 0..<nums.count {
            // 当前值与上一个值相等。且上一个值
            if i > 0 && nums[i] == nums[i - 1] &&  used[i - 1] == false {
                continue
            }
            // 纵向去重
            if used[i] {
                continue
            }
            used[i] = true
            path.append(nums[i])
            backtrance(nums)
            path.removeLast()
            used[i] = false
        }
    }
    func permuteUnique2(_ nums: [Int]) -> [[Int]] {
        used = Array(repeating: false, count: nums.count)
        backtrance(nums)
        return result
    }
    // 这个比较好理解，但开销大一些
    func backtrance2(_ nums: [Int]) {
        if nums.count == path.count {
            result.append(path)
            return
        }
        var set = Set<Int>()
        for i in 0..<nums.count {
            // 层去重
            if set.contains(nums[i]) {
                continue
            }
            // 纵向去重
            if used[i] {
                continue
            }
            set.insert(nums[i])
            used[i] = true
            path.append(nums[i])
            backtrance2(nums)
            path.removeLast()
            used[i] = false
        }
    }
    class func test() {
        let solution = Solution47()
        let nums = [1,1,2]
        let result = solution.permuteUnique(nums)
        print(result)
    }
}
