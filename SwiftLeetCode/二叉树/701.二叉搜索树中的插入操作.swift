//
//  701.二叉搜索树中的插入操作.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/12.
//

import Foundation
class Solution701 {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else {
            let newNode = TreeNode(val)
            return newNode
        }
        if root.val > val {
            // 左子树插入
            root.left = insertIntoBST(root.left, val)
        } else {
            // 右子树插入
            root.right = insertIntoBST(root.right, val)
        }
        return root
    }
   
    class func test() {
//        let node4 = TreeNode(4)
//        let node2 = TreeNode(2)
//        let node1 = TreeNode(1)
//        let node3 = TreeNode(3)
//        let node7 = TreeNode(7)
//
//        node4.left = node2
//        node2.left = node1
//        node2.right = node3
//        node4.right = node7
        
        
//        [61,46,66,43,null,null,null,39,null,null,null]
        let node61 = TreeNode(61)
        let node46 = TreeNode(46)
        let node66 = TreeNode(66)
        let node43 = TreeNode(43)
        let node39 = TreeNode(39)
        node61.left = node46
        node61.right = node66
        node46.left = node43
        node43.left = node39
        
        let solution = Solution701()
        
        let result = solution.insertIntoBST(node61, 88)
        print(result)
    }
}
