//
//  617.合并二叉树.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/11.
//
// 合并二叉树
// 只需要合并当前节点就可以。
import Foundation
class Solution617 {
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        if root1?.left != nil && root2?.left != nil {
            root1?.val = root1!.val + root2!.val
        }
        
//        if root1 != nil && root2 != nil {
//            root1?.val = root1!.val + root2!.val
//        }
//        if root1 == nil && root2 != nil {
//
//        }
        return nil
    }
    class func test(){
        
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
