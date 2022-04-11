//
//  513.找树左下角的值.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/11.
//
// 最直观的解法是采用层序遍历。因为我要知道最大深度。而且是最左边的。
// 所以每次进入一层时，都要计算当前子节点的深度。找到最深节点的做节点。进行比较。
// 如果直接采用层序遍历是最直观的方法。
import Foundation
class Solution513 {
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var queue: [TreeNode] = []
        queue.append(root)
        var everyLeft: TreeNode?
        while !queue.isEmpty {
            var size = queue.count
            // 每一层最左边
            everyLeft = queue.first
            while size > 0 {
                let node = queue.removeFirst()
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
                size -= 1
            }
        }
        return everyLeft?.val ?? 0
    }
    class func test() {
        let solution = Solution513()
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        let node4 = TreeNode(4)
        let node5 = TreeNode(5)
        let node6 = TreeNode(6)
        let node7 = TreeNode(7)
        
        node1.left = node2
        node2.left =  node4
        node1.right = node3
        node3.left = node5
        node3.right = node6
        node5.left = node7
        
        let result = solution.findBottomLeftValue(node1)
        print(result)
    }
}
