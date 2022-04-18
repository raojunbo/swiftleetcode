//
//  108.将有序数组转换为二叉搜索树.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/13.
//
// 将有序数组转换成搜索二叉树。
//
import Foundation
class Solution108 {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        var nums = nums
        return build(&nums, start: 0, end: nums.count - 1)
    }
    func build(_ nums: inout [Int], start: Int, end:Int) -> TreeNode? {
        if start > end {
            return nil
        }
        let mid = (start + end) / 2
        let node = TreeNode(nums[mid])
        node.left = build(&nums, start: start, end: mid - 1)
        node.right = build(&nums, start: mid + 1, end: end)
        return node
    }
    class func test() {
        let solution = Solution108()
//        let nums = [-10,-3,0,5,9]
        let nums =  [1,3]
        let result = solution.sortedArrayToBST(nums)
        print(result)
    }
}
