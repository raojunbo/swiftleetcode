//
//  654.最大二叉树.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/11.
//
// 最大二叉树
import Foundation
class Solution654 {
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        var nums = nums
        return build(&nums, start: 0, end: nums.count - 1)
    }
    func build(_ nums: inout [Int], start: Int, end: Int) -> TreeNode? {
        guard start <= end else {
            return nil
        }
        // 在指定区间找到最大值的索引
        let maxIndex = findMaxIndex(&nums, start: start, end: end)
        let node = TreeNode(nums[maxIndex])
        // 左右递归构建子树
        node.left = build(&nums, start: start, end: maxIndex - 1)
        // 右边递归构建子树
        node.right = build(&nums, start: maxIndex + 1, end: end)
        return node
    }
    func findMaxIndex(_ nums: inout [Int], start: Int, end: Int) -> Int {
        var index = start
        var value = nums[start]
        for i in start...end {
            let item = nums[i]
            if item > value {
                index = i
                value = item
            }
        }
        return index
    }
    class func test() {
        let solution = Solution654()
        let nums = [3,2,1,6,0,5]
        let result =  solution.constructMaximumBinaryTree(nums)
        print(result)
    }
}
