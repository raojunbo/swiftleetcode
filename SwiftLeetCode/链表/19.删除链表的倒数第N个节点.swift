//
//  19.删除链表的倒数第N个节点.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/3/31.
//

import Foundation
class Solution19 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let vhead = ListNode(-1)
        vhead.next = head
        
        var slow: ListNode? = vhead
        var fast = head
        var m = n
        while fast != nil {
            if m <= 0 {
                slow = slow?.next
            }
            m -= 1
            fast = fast?.next
        }
        slow?.next = slow?.next?.next
        return vhead.next
    }
    class func test() {
        let solution = Solution19()
        let node1 = ListNode(1)
//        let node2 = ListNode(2)
//        let node3 = ListNode(3)
//        let node4 = ListNode(4)
//        let node5 = ListNode(5)
//        node1.next = node2
//        node2.next = node3
//        node3.next = node4
//        node4.next = node5
        
        let result = solution.removeNthFromEnd(node1, 1)
        print(result)
    }
}
