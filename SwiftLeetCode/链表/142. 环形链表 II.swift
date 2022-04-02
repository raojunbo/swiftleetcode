//
//  142. 环形链表 II.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/3/31.
//

import Foundation
class Solution142 {
    // 环信链表
    // 使用快慢指针，找到相遇的点。
    // 一个指针从开头开始，另一个指针从相遇出开始，最终他们的相遇处就是环的相交点
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        while fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                slow = head
                while slow !== fast {
                    slow = slow?.next
                    fast = fast?.next
                }
                return slow
            }
        }
        return nil
    }
    class func test() {
        let node3 = ListNode(3)
        let node2 = ListNode(2)
        let node0 = ListNode(0)
        let node4 = ListNode(-4)
        node4.next = node2
        node3.next = node2
        node2.next = node0
        node0.next = node4
        let solution = Solution142()
        let result =  solution.detectCycle(node3)
        print(result)
    }
}
