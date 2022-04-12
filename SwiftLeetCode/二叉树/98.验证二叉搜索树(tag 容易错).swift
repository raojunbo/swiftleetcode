//
//  98.验证二叉搜索树.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/12.
//
//节点的左子树只包含 小于 当前节点的数。
//节点的右子树只包含 大于 当前节点的数。
//所有左子树和右子树自身必须也是二叉搜索树。
// 解法一：使用中序遍历。
// 解法二：子树递归，但其中有陷阱
import Foundation
class Solution98 {
    // 这是错误的写法。里面有一种情况没有考虑到。例如[5,1,4,null,null,3,6]
    //    func isValidBST(_ root: TreeNode?) -> Bool {
    //        guard let root = root else {
    //            return true
    //        }
    //        if let left = root.left, left.val >= root.val {
    //            return false
    //        }
    //        if let right = root.right, right.val <= root.val {
    //            return false
    //        }
    //        return isValidBST(root.left) && isValidBST(root.right)
    //    }
    func isValidBST(_ root: TreeNode?) -> Bool {
        return recurse(root, lower: Int.min, upper: Int.max)
    }
    func recurse(_ root: TreeNode?, lower: Int, upper: Int) -> Bool {
        guard let root = root else {
            return true
        }
        
        if let left = root.left {
            if left.val >= root.val  || left.val <= lower || left.val >= upper {
                return false
            }
        }
        if let right = root.right {
            if right.val <= root.val || right.val <= lower || right.val >= upper {
                return false
            }
        }
        return recurse(root.left,lower: lower, upper: root.val) && recurse(root.right, lower: root.val, upper: upper)
    }
    // 采用中序遍历
    var pre: Int = Int.min
    var isValid = true
    func isValidBST2(_ root: TreeNode?) -> Bool {
        inOrder(root)
        return isValid
    }
    func inOrder(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        inOrder(root.left)
        if root.val <= pre {
            isValid = false
            return
        }
        pre = root.val
        inOrder(root.right)
    }
    class func test() {
        let solution = Solution98()
        //                let node2 = TreeNode(2)
        //                let node1 = TreeNode(1)
        //                let node3 = TreeNode(3)
        ////
        //        let node5 = TreeNode(5)
        //        let node1 = TreeNode(1)
        //        let node4 = TreeNode(4)
        //        let node3 = TreeNode(3)
        //        let node6 = TreeNode(6)
        //
        //        node5.left = node1
        //        node5.right = node4
        //        node4.left = node3
        //        node4.right = node6
        ////
        //        let node5 = TreeNode(5)
        //        let node4 = TreeNode(4)
        //        let node6 = TreeNode(6)
        //        let node3 = TreeNode(3)
        //        let node7 = TreeNode(7)
        //
        //        node5.left = node4
        //        node5.right = node6
        //        node6.left = node3
        //        node6.right = node7
        //
        let node20 = TreeNode(2)
        let node21 = TreeNode(2)
        let node22 = TreeNode(2)
        node20.left = node21
        node20.right = node22
        let result =  solution.isValidBST(node20)
        print(result)
    }
}
