//
//  450.删除二叉搜索树中的节点.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/12.
//
// 删除二叉搜索树种的节点
// 找到节点
// 节点的右子树的最小节点放入。
import Foundation
class Solution450 {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        var root = root
        if root == nil {
            return root
        }
        if root?.val == key {
            
            if root?.left == nil {
                // 要删除的左子节点为空
                return root?.right
            } else if root?.right == nil {
                // 要删除的右子节点为空
                return root?.left
            } else {
                // 找右子树上最左的节点
                var cur: TreeNode? = root?.right
                while cur?.left != nil {
                    cur = cur?.left
                }
                cur?.left = root?.left // 将root的左子树放在右子树的孩子节点上
                root = root?.right // 返回root的右子树
            }
        }else if root!.val < key {
            root?.right = deleteNode(root?.right, key)
        } else if root!.val > key {
            root?.left = deleteNode(root?.left, key)
        }
        return root
    }
    
    class func test() {
        let solution = Solution450()
        let node5 = TreeNode(5)
        let node3 = TreeNode(3)
        let node6 = TreeNode(6)
        let node2 = TreeNode(2)
        let node4 = TreeNode(4)
        let node7 = TreeNode(7)
        node5.left = node3
        node3.left = node2
        node3.right = node4
        node5.right = node6
        node6.right = node7
        
        let result = solution.deleteNode(node5, 5)
        print(result)
    }
}
