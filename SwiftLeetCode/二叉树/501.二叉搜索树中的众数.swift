//
//  501.二叉搜索树中的众数.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/12.
//

import Foundation
class Solution501 {
    var pre: Int?
    var preCount: Int = 0 // 上一个节点的个数
    var maxCount: Int = 0 // 最大节点个数
    var result: [Int] = [] // 结果值
    func findMode(_ root: TreeNode?) -> [Int] {
        inorder(root)
        return result
    }
    func inorder(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        inorder(root.left)
        // 前一个存在，且与前一个相等
        if let pre = pre, root.val == pre {
            preCount += 1
        } else {
            pre = root.val
            preCount = 1
        }
        if preCount == maxCount {
            result.append(root.val)
        } else if preCount > maxCount {
            result.removeAll()
            result.append(root.val)
            maxCount = preCount
        }
        inorder(root.right)
    }
    class func test() {
        let solution = Solution501()
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node22 = TreeNode(2)
        node1.right = node2
        node2.left = node22
        let result = solution.findMode(node1)
        print(result)
    }
}
