//
//  106.从中序与后序遍历序列构造二叉树.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/11.
//
// 中序遍历确定根，左根右，分区
// 后续遍历确定根 左右根
// 先确定根
import Foundation
class Solution106 {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        // 1. 先根据postorder找到根
        // 2. 再根据inorder进行分区
        var inorder = inorder
        var postorder = postorder
        return build(inorder: &inorder, instart: 0, inend: inorder.count - 1, postorder: &postorder, poststart: 0, postend: postorder.count - 1)
    }
    // 根节点在中序遍历中的位置，和以start为开始节点到根节点的数量
    func findInOrder(_ inorder: [Int], start: Int, end: Int, value: Int) -> (Int, Int){
        var index = start
        for i in start...end {
            let item = inorder[i]
            if item == value {
                index = i
                break
            }
        }
        let leftNodeCount = (index - start)
        return (index, leftNodeCount)
    }
    func build(inorder: inout [Int], instart: Int, inend: Int, postorder: inout [Int], poststart: Int, postend: Int) -> TreeNode? {
        guard instart <= inend else {
            return nil
        }
        guard poststart <= postend else {
            return nil
        }
        let rootValue = postorder[postend]
        let rootNodeInOrderTupe = findInOrder(inorder, start: instart, end: inend, value: rootValue)
        let rootNodeIndexInOrder = rootNodeInOrderTupe.0 // 根节点在中序遍历中的index
        let leftNodeCount = rootNodeInOrderTupe.1 // 中序遍历序列从开始到根节点的节点数量
        
        let node = TreeNode(rootValue)
        // 构建左子树
        node.left =  build(inorder: &inorder, instart: instart, inend: rootNodeIndexInOrder - 1, postorder: &postorder, poststart: poststart, postend: poststart + leftNodeCount - 1)
        // 构建右子树
        node.right = build(inorder: &inorder, instart: rootNodeIndexInOrder + 1, inend: inend, postorder: &postorder, poststart: poststart + leftNodeCount , postend: postend - 1)
        return node
    }
    class func test() {
        let solution = Solution106()
        let inorder = [9,3,15,20,7], postorder = [9,15,7,20,3]
        let result = solution.buildTree(inorder, postorder)
        print(result)
    }
}
