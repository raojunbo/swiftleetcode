//
//  236. 二叉树的最近公共祖先.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/12.
//
// 两个子树同时找到指定的节点
import Foundation
class Solution236 {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        // 只要有任意一个相等就返回
        if root === p || root === q {
            return root
        }
       
        let left = lowestCommonAncestor(root.left, p, q)
        let right = lowestCommonAncestor(root.right, p, q)
        
        if left != nil && right != nil {
            return root
        } else if left != nil {
            return left
        } else if right != nil {
            return right
        }
        return nil
    }
    class func test() {
        let solution = Solution236()
        let node3 = TreeNode(3)
        let node5 = TreeNode(5)
        let node6 = TreeNode(6)
        let node2 = TreeNode(2)
        let node7 = TreeNode(7)
        let node4 = TreeNode(4)
        let node1 = TreeNode(1)
        let node0 = TreeNode(0)
        let node8 = TreeNode(8)

        node3.left = node5
        node5.left = node6
        node5.right = node2
        node2.left = node7
        node2.right = node4
        node3.right = node1
        node1.left = node0
        node1.right = node8
        
        let result = solution.lowestCommonAncestor(node3, node5, node4)
        print(result)
    }
}
