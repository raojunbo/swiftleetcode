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
        guard let root = root else {
            return root
        }
        if root.val == key {
            let rootleft = root.left
            let rootright = root.right
            
            // 寻找右子树的最小节点，不断找最左边
            let vNode = TreeNode(-1)
            vNode.left = rootright
            var parent: TreeNode? = vNode
            var cursor: TreeNode? = vNode.left
            while cursor?.left != nil {
                parent = cursor
                cursor = cursor?.left
            }
           
            cursor?.left = rootleft
            cursor?.right = vNode.left
            parent?.left = nil
            return cursor
        }else if root.val < key {
            root.right = deleteNode(root.right, key)
        } else if root.val > key {
            root.left = deleteNode(root.left, key)
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
