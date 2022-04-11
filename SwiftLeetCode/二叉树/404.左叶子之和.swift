//
//  404.左叶子之和.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/11.
//

import Foundation
// 一个节点的左边节点时也子节点
// 遍历所有节点，求其子树的左边的节点是否是也子节点
// 其实还有一个递归思路
class Solution404 {
    var result = 0
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        preOrder(node: root)
        return result
    }
    func preOrder(node: TreeNode?) {
        if node == nil {
            return
        }
        // 当前节点的左边节点的左右都为nil，这个节点就是要找的节点
        let left = node?.left
        if left != nil && left?.left == nil && left?.right == nil {
            result += left!.val
        } else {
            preOrder(node: left)
        }
        preOrder(node: node?.right)
    }
    class func test() {
        let solution = Solution404()
        
        let node3 = TreeNode(3)
        let node9 = TreeNode(9)
        let node20 = TreeNode(20)
        let node15 = TreeNode(15)
        let node7 = TreeNode(7)
        
        node3.left = node9
        node3.right = node20
        node20.left = node15
        node20.right = node7
        
        let result = solution.sumOfLeftLeaves(node3)
        print(result)
    }
}
