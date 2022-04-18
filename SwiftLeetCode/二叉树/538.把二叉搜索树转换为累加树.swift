//
//  538.把二叉搜索树转换为累加树.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/13.
//
// 右根左
// 实际上是中序遍历,左根右-》右根左
import Foundation
class Solution538 {
    var pre: Int?
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        convertBST(root.right)
        root.val = root.val + (pre ?? 0)
        pre = root.val
        convertBST(root.left)
        return root
    }
   
    class func test() {
        let solution = Solution538()
        let node4 = TreeNode(4)
        let node1 = TreeNode(1)
        let node0 = TreeNode(0)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        let node6 = TreeNode(6)
        let node5 = TreeNode(5)
        let node7 = TreeNode(7)
        let node8 = TreeNode(8)
        node4.left = node1
        node1.left = node0
        node1.right = node2
        node2.right = node3
        node4.right = node6
        node6.left = node5
        node6.right = node7
        node7.right = node8
        let result = solution.convertBST(node4)
        print(result)
    }
}
