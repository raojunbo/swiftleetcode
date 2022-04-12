//
//  530.二叉搜索树的最小绝对差.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/12.
//
// 二叉搜索树的最小绝对差
import Foundation
class Solution530 {
    var pre: Int?
    var minResult = Int.max
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        inorder(root)
        return minResult
    }
    func inorder(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        inorder(root.left)
        if let pre = pre {
            minResult = min(root.val - pre, minResult)
        }
        pre = root.val
        inorder(root.right)
    }
    class func test() {
        let node4 = TreeNode(4)
        let node2 = TreeNode(2)
        let node1 = TreeNode(1)
        let node3 = TreeNode(3)
        let node6 = TreeNode(6)

        node4.left = node2
        node2.left = node1
        node2.right = node3
        node4.right = node6
        
//        let node1 = TreeNode(1)
//        let node0 = TreeNode(0)
//        let node48 = TreeNode(48)
//        let node12 = TreeNode(12)
//        let node49 = TreeNode(49)
//        node1.left = node0
//        node1.right = node48
//        node48.left = node12
//        node48.right = node49
        
        let solution = Solution530()
        let result = solution.getMinimumDifference(node4)
        print(result)
    }
}
