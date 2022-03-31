//
//  707. 设计链表.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/3/31.
//

import Foundation

class MyLinkedList {
    var vhead: ListNode = ListNode(-1)
    var size = 0
    init() {
        
    }
    func get(_ index: Int) -> Int {
        if index < 0 || index >= size {
            return -1
        }
        var cur = vhead.next
        var i = index
        while i > 0 {
            cur = cur?.next
            i -= 1
        }
        return cur?.val ?? -1
    }
    func addAtHead(_ val: Int) {
        let nextNode = vhead.next
        
        let newNode = ListNode(val)
        vhead.next = newNode
        
        newNode.next = nextNode
        size += 1
    }
    func addAtTail(_ val: Int) {
        var cur:ListNode? = vhead
        while cur?.next != nil {
            cur = cur?.next
        }
        cur?.next = ListNode(val)
        size += 1
    }
    func addAtIndex(_ index: Int, _ val: Int) {
        if index > size {
            return
        }
        
        let newNode = ListNode(val)
        var curNode: ListNode? = vhead
        var curIndex = index
        
        while curIndex > 0 {
            curNode = curNode?.next
            curIndex -= 1
        }
        
        newNode.next = curNode?.next
        curNode?.next = newNode
        size += 1
        
    }
    func deleteAtIndex(_ index: Int) {
        if index >= size || index < 0{
            return
        }
        var cur: ListNode? = vhead
        for _ in 0..<index {
            cur = cur?.next
        }
        cur?.next = cur?.next?.next
        size -= 1
    }
}
class Solution707 {
    class func test() {
        let link = MyLinkedList()
        link.addAtHead(1)
        link.addAtTail(3)
        link.addAtIndex(1, 2)
        //        link.deleteAtIndex(0)
        //        link.desc()
    }
}
