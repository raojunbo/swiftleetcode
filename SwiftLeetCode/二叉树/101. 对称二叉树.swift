//
//  101. 对称二叉树.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/8.
//
// 判断二叉树是否对称
//
import Foundation
class Solution101 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isTwoSymmetric(left: root?.left, right: root?.right)
    }
    func isTwoSymmetric(left: TreeNode?, right: TreeNode?) -> Bool {
        if left?.val != right?.val {
            return false
        }
        if left == nil && right == nil {
            return true
        }
        let leftSym = isTwoSymmetric(left: left?.left, right: right?.right)
        let rightSym = isTwoSymmetric(left: left?.right, right: right?.left)
        return leftSym && rightSym
    }
    class func test() {
        let solution = Solution101()
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node22 = TreeNode(2)
        let node3 = TreeNode(3)
        let node4 = TreeNode(4)
        let node44 = TreeNode(4)
        let node33 = TreeNode(3)
        
        node1.left = node2
        node1.right = node22
        node2.left = node3
        node2.right = node4
        node22.left = node44
        node22.right = node33
        let result = solution.isSymmetric(node1)
        print(result)
    }
}
