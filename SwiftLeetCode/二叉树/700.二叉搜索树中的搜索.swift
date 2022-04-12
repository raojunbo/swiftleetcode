//
//  700.二叉搜索树中的搜索.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/12.
//
// 二叉搜索树的中序遍历是有序的。
//二叉搜索树满足如下性质：
//
//左子树所有节点的元素值均小于根的元素值；
//右子树所有节点的元素值均大于根的元素值。
import Foundation
class Solution700 {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root == nil {
            return nil
        }
        if root?.val == val {
            return root
        }
        return root!.val > val ? searchBST(root?.left, val): searchBST(root?.right, val)
       
    }
    class func test() {
        let solution = Solution700()
        let node4 = TreeNode(4)
        let node2 = TreeNode(2)
        let node1 = TreeNode(1)
        let node3 = TreeNode(3)
        let node7 = TreeNode(7)
        
        node4.left = node2
        node2.left = node1
        node2.right = node3
        node4.right = node7
        
        let result = solution.searchBST(node4, 2)
        print(result)
    }
}
