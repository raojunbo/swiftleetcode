//
//  04.二叉树的最大深度.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/8.
//
// 二叉树的最大深度。
// 可以采用层序遍历。
// 也可以采用深度优先遍历
// 采用子树深度相加
import Foundation
class Solution04 {
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let left = maxDepth(root?.left)
        let right = maxDepth(root?.right)
        let depth = max(left, right) + 1
        return depth
    }
    class func test() {
        let solution = Solution04()
        let node3 = TreeNode(3)
//        let node9 = TreeNode(9)
//        let node20 = TreeNode(20)
//        let node15 = TreeNode(15)
//        let node7 = TreeNode(7)
//        node3.left = node9
//        node3.right = node20
//        node20.left = node15
//        node20.right = node7
        let result = solution.maxDepth(node3)
        print(result)
        //        let result = solution.maxDepth(node3)
        //        print(result)
    }
}
