//
//  24. 两两交换链表中的节点.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/3/31.
//

import Foundation
class Solution24 {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        // 正常的模拟交换
        // 注意最后的节点不够的情况
        let vhead = ListNode(-1)
        vhead.next = head
        
        var pre: ListNode? = vhead
        while pre != nil {
            let first = pre?.next // 当前分组的第一个节点
            if first == nil {
                break
            }
            let second = first?.next // 当前分组的第二个节点
            if second == nil {
                break
            }
            let next = second?.next // 第二个分组的第一个节点
            second?.next = first // 当前分组的第二个节点指向了第一个节点
            pre?.next = second // 第二个节点变成第一个节点
            first?.next = next // 链接下一个分组
            pre = first // 重设pre
        }
        return vhead.next
    }
    class func test() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        
        let solution = Solution24()
        let result = solution.swapPairs(node1)
        print(result)
    }
}
