//
//  110. 平衡二叉树.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/11.
//
// 平衡二叉树
// 左右子树的树的深度不能超过1
// 如何能提前结束

import Foundation
class Solution110 {
    var isBalance = true
    func isBalanced(_ root: TreeNode?) -> Bool {
        depth(root: root)
        return isBalance
    }
    @discardableResult
    func depth(root: TreeNode?) -> Int {
        if !isBalance {
            return 0
        }
        if root == nil {
            return 0
        }
        let leftHeight = depth(root: root?.left)
        let rightHeight = depth(root: root?.right)

        if abs(leftHeight - rightHeight) > 1 {
            isBalance = false
            return 0
        }
        return max(leftHeight, rightHeight) + 1
    }
    class func test() {
        let solution = Solution110()
        let node3 = TreeNode(3)
        let node9 = TreeNode(9)
        let node20 = TreeNode(20)
        let node15 = TreeNode(15)
        let node7 = TreeNode(7)
        
        node3.left = node9
        node3.right = node20
        node20.left = node15
        node20.right = node7
        
        let result = solution.isBalanced(node3)
        print(result)
    }
}
