//
//  113. 路径总和ii.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/11.
//

import Foundation
class Solution113 {
    var path: [Int] = []
    var result: [[Int]] = []
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        pathSumTraverse(root, targetSum)
        return result
    }
    func pathSumTraverse(_ node: TreeNode?, _ targetSum: Int) {
        if node == nil {
            return
        }
        path.append(node!.val)
        let targetSum = targetSum - (node?.val ?? 0)
        // 正好是我们要找的叶子节点
        if targetSum == 0 && node?.left == nil && node?.right == nil {
            result.append(path)
            path.removeLast()
            return
        }
        // 继续递归
        pathSumTraverse(node?.left,targetSum)
        pathSumTraverse(node?.right, targetSum)
        path.removeLast()
    }
    
    class func test() {
        let solution = Solution113()
        let node5 = TreeNode(5)
        let node4 = TreeNode(4)
        let node11 = TreeNode(11)
        let node7 = TreeNode(7)
        let node2 = TreeNode(2)
        let node8 = TreeNode(8)
        let node13 = TreeNode(13)
        let node44 = TreeNode(4)
        let node55 = TreeNode(5)
        let node1 = TreeNode(1)
        
        node5.left = node4
        node4.left = node11
        node11.left = node7
        node11.right = node2
        node5.right = node8
        node8.left = node13
        node8.right = node44
        node44.left = node55
        node4.right = node1
        
        let result = solution.pathSum(node5, 22)
        print(result)
    }
}
