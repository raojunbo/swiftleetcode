//
//  617.合并二叉树.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/11.
//
// 合并二叉树
import Foundation
class Solution617 {
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        if root1 == nil {
            return root2
        }
        if root2 == nil {
            return root1
        }
        root1?.val = root1!.val + root2!.val
        root1?.left = mergeTrees(root1?.left, root2?.left)
        root1?.right = mergeTrees(root1?.right, root2?.right)
        return root1
    }
    
    class func test(){
        let node1 = createOne()
        let node2 = createTwo()
        let solution = Solution617()
        let result = solution.mergeTrees(node1, node2)
        print(result)
    }
    class func createOne() -> TreeNode? {
        let node1 = TreeNode(1)
        let node3 = TreeNode(3)
        let node2 = TreeNode(2)
        let node5 = TreeNode(5)
        node1.left = node3
        node3.left = node5
        node1.right = node2
        return node1
    }
    class func createTwo() -> TreeNode? {
        let node2 = TreeNode(2)
        let node1 = TreeNode(1)
        let node4 = TreeNode(4)
        let node3 = TreeNode(3)
        let node7 = TreeNode(7)
        node2.left = node1
        node2.right = node3
        node1.right = node4
        node3.right = node7
        return node2
    }
}
