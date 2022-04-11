//
//  111.二叉树的最小深度.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/8.
//
// 二叉树的最小深度
//
import Foundation
class Solution111 {
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let leftDeep = minDepth(root?.left)
        let rightDeep = minDepth(root?.right)
        // 左边右边都有
        var minDeep = min(leftDeep, rightDeep) + 1
        // 只有右边有
        if leftDeep == 0 && rightDeep != 0 {
            minDeep = rightDeep + 1
        }
        // 只有左边有
        if leftDeep != 0 && rightDeep == 0 {
             minDeep = leftDeep + 1
        }
        return minDeep
    }
   
    class func test() {
        let solution = Solution111()
        
//        let node3 = TreeNode(3)
//        let node9 = TreeNode(9)
//        let node20 = TreeNode(20)
//        let node15 = TreeNode(15)
//        let node7 = TreeNode(7)
//
//        node3.left = node9
//        node3.right = node20
//        node20.left = node15
//        node20.right = node7
        
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        let node4 = TreeNode(4)
        let node5 = TreeNode(5)
        let node6 = TreeNode(6)
        node2.right = node3
        node3.right = node4
        node4.right = node5
        node5.right = node6
        
        let result = solution.minDepth(node2)
        print(result)
    }
}
