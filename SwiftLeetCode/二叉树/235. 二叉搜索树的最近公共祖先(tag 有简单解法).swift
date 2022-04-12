//
//  235. 二叉搜索树的最近公共祖先.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/12.
//
// 二叉搜索树的公共祖先。
// 可以利用二叉搜索树的特性。根节点大于左子树，根节点大于右子树。
// 其实只要从上到下遍历的时候，cur节点是数值在[p, q]区间中则说明该节点cur就是最近公共祖先了。
import Foundation
class Solution235 {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        // 都在右边
        if root.val < p!.val && root.val < q!.val {
            return lowestCommonAncestor(root.right, p, q)
        }
        // 都在左边
        if root.val > p!.val && root.val > q!.val {
            return  lowestCommonAncestor(root.left, p, q)
        }
        // 左右两边都有。这个就是公共祖先
        return root
    }
    class func test() {
        let solution = Solution235()

        let node6 = TreeNode(6)
        let node2 = TreeNode(2)
        let node0 = TreeNode(0)
        let node4 = TreeNode(4)
        let node3 = TreeNode(3)
        let node5 = TreeNode(5)
        let node8 = TreeNode(8)
        let node7 = TreeNode(7)
        let node9 = TreeNode(9)
        
        node6.left = node2
        node2.left = node0
        node2.right = node4
        node4.left = node3
        node3.right = node5
        node6.right = node8
        node8.left = node7
        node7.right = node9
        
        let result =  solution.lowestCommonAncestor(node6, node2, node8)
        print(result)
    }
}
