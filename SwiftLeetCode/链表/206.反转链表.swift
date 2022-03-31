//
//  206.反转链表.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/3/31.
//

import Foundation
class Solution206 {
    // 头插法更容易理解
    func reverseList(_ head: ListNode?) -> ListNode? {
        let vhead = ListNode(-1)
        var cur = head
        while cur != nil {
            let next = cur?.next
            let vheadNext = vhead.next
            vhead.next = cur
            cur?.next = vheadNext
            cur = next
        }
        return vhead.next
    }
    // 双指针
    func reverseList2(_ head: ListNode?) -> ListNode? {
       return nil
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
        
        let solution = Solution206()
        let result = solution.reverseList(node1)
        print(result)
    }
}
