//
//  222. 完全二叉树的节点个数.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/11.
//
// 完全二叉树的节点个数
// 前序遍历。遇到左节点有值，右节点无值，停止搜索。
// 因为是完全二叉树，需要添加一个条件
import Foundation

class Solution222 {
    func countNodes(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        // 添加一些完全二叉树的条件
        // 左子树的深度与右子树的深度相同时，不用递归计算了。节点个数为 2 * height + 1
        var leftN = root?.left
        var rightN = root?.right
        var leftHeight = 0, rightHeight = 0
        while leftN != nil {
            leftN = leftN?.left
            leftHeight += 1
        }
        while rightN != nil {
            rightN = rightN?.right
            rightHeight += 1
        }
        if leftHeight == rightHeight {
            // 相当于2的n次方
            return 2 << leftHeight - 1
        }
        // 左子树节点个数，右子树节点个数
        let leftC = countNodes(root?.left)
        let rightC = countNodes(root?.right)
        return leftC + rightC + 1
    }
    class func test() {
        let solution = Solution222()
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        let node4 = TreeNode(4)
        let node5 = TreeNode(5)
        let node6 = TreeNode(6)
        
        node1.left = node2
        node2.left = node4
        node2.right = node5
        node1.right = node3
        node3.left = node6
        let result = solution.countNodes(node1)
        print(result)
    }
}
