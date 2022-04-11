//
//  226.翻转二叉树.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/8.
//
// 递归将子树进行翻转就行。
// 采用前序遍历，就可以。
import Foundation

class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    init(_ val: Int) {
        self.val = val
    }
}

class Solution226 {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        let right = invertTree(root?.left)
        let left =  invertTree(root?.right)
        root?.left = left
        root?.right = right
        return root
    }
    
    class func test() {
        let solution = Solution226()
        let node4 = TreeNode(4)
        let node2 = TreeNode(2)
        let node7 = TreeNode(7)
        let node1 = TreeNode(1)
        let node3 = TreeNode(3)
        let node6 = TreeNode(6)
        let node9 = TreeNode(9)
        
        node4.left = node2
        node4.right = node7
        node2.left = node1
        node2.right = node3
        node7.left = node6
        node7.right = node9
        
        let result = solution.invertTree(node4)
        print(result)
    }
}
