//
//  669. 修剪二叉搜索树.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/13.
//

import Foundation
class Solution669 {
    func trimBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> TreeNode? {
        if root == nil {
            return root
        }
        if root!.val >= low && root!.val <= high {
            root?.left = trimBST(root?.left, low, high)
            root?.right = trimBST(root?.right, low, high)
        } else if root!.val < low {
            // 舍弃左子树
            root?.left = nil
            return trimBST(root?.right, low, high)
        } else if root!.val > high {
            // 舍弃右子树
            root?.right = nil
            return trimBST(root?.left, low, high)
        }
        return root
    }
    class func test() {
        let solution = Solution669()
//        let node3 = TreeNode(3)
//        let node0 = TreeNode(0)
//        let node4 = TreeNode(4)
//        let node2 = TreeNode(2)
//        let node1 = TreeNode(1)
//        node3.left = node0
//        node3.right = node4
//        node0.right = node2
//        node2.left = node1
        
        let node1 = TreeNode(1)
        let node0 = TreeNode(0)
        let node2 = TreeNode(2)
        node1.left = node0
        node1.right = node2
        
        let result = solution.trimBST(node1, 1, 2)
        print(result)
    }
}
