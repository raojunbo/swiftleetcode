//
//  203. 移除链表元素.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/3/31.
//

import Foundation

class ListNode {
    var val: Int = 0
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
    }
}

class Solution203 {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let vHead = ListNode(-1)
        vHead.next = head
        var pre:ListNode? = vHead
        var cur:ListNode? = pre?.next
        while cur != nil {
            if cur?.val == val {
                cur = cur?.next
                pre?.next = cur
            } else {
                pre = cur
                cur = cur?.next
            }
        }
        return vHead.next
    }
    class func test() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(6)
        let node4 = ListNode(3)
        let node5 = ListNode(4)
        let node6 = ListNode(5)
        let node7 = ListNode(6)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node6
        node6.next = node7
        
        let solution = Solution203()
        let vHead = solution.removeElements(node1, 6)
        print(vHead)
    }
}
