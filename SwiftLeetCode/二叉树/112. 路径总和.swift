//
//  112. 路径总和.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/11.
//
// 叶子节点
//
import Foundation
class Solution112 {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        if root == nil {
            return false
        }
        let targetSum = targetSum - (root?.val ?? 0)
        // 已经小了
//        if targetSum < 0 {
//            return false
//        }
        // 正好相等
        if targetSum == 0 && root?.left == nil && root?.right == nil {
            return true
        }
        // 继续
        return  hasPathSum(root?.left, targetSum) || hasPathSum(root?.right, targetSum)
    }
    class func test() {
        let solution = Solution112()
//        let node5 = TreeNode(5)
//        let node4 = TreeNode(4)
//        let node11 = TreeNode(11)
//        let node7 = TreeNode(7)
//        let node2 = TreeNode(2)
//        let node8 = TreeNode(8)
//        let node13 = TreeNode(13)
//        let node44 = TreeNode(4)
//        let node1 = TreeNode(1)
//
//        node5.left = node4
//        node4.left = node11
//        node11.left = node7
//        node11.right = node2
//        node5.right = node8
//        node8.left = node13
//        node8.right = node44
//        node4.right = node1
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        node1.left = node2
        node1.right = node3
        let result = solution.hasPathSum(node1, 5)
        print(result)
    }
}
