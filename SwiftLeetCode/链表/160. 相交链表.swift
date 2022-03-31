//
//  02.07. 链表相交.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/3/31.
//

import Foundation

class Solution160 {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var curA = headA
        var curB = headB
        while curA !== curB {
            if curA == nil {
                curA = headB
            } else {
                curA = curA?.next
            }
            if curB == nil {
                curB = headA
            } else {
                curB = curB?.next
            }
        }
        return curA
    }
    class func test() {
        let solution = Solution160()
        
        let node4 = ListNode(4)
        let node1 = ListNode(1)
        
        node4.next = node1
        
        let node5 = ListNode(5)
        let node6 = ListNode(6)
        let node11 = ListNode(1)
        
        node5.next = node6
        node6.next = node11
        
        let node8 = ListNode(8)
        let node44 = ListNode(4)
        let node55 = ListNode(5)
        
        node1.next = node8
        node8.next = node44
        node44.next = node55
        
        node11.next = node8
        
        let result =  solution.getIntersectionNode(node4, node5)
        print(result)
    }
}
