//
//  257. 二叉树的所有路径.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/11.
//
// 二叉树的所有路径
// 遍历二叉树，在叶子节点时，记录栈的路径。就可以了。
// 左右节点都为空
import Foundation
class Solution257 {
    var stack: [String] = []
    var result: [String] = []
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        preOrder(node: root)
        return result
    }
    func preOrder(node: TreeNode?) {
        if node == nil {
            return
        }
        stack.append(String(node!.val))
        // 左右子节点都为空，则为路径
        if node?.left == nil && node?.right == nil {
            result.append(stack.joined(separator: "->"))
            stack.removeLast()
            return
        }
        // 左节点不为空
        if node?.left != nil {
            preOrder(node: node!.left)
        }
        // 右节点不为空
        if node?.right != nil {
            preOrder(node: node!.right)
        }
        stack.removeLast()
    }
    class func test() {
        let solution = Solution257()
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        let node5 = TreeNode(5)
        
        node1.left = node2
        node1.right = node3
        node2.right = node5
        
        let result = solution.binaryTreePaths(node1)
        print(result)
    }
}
