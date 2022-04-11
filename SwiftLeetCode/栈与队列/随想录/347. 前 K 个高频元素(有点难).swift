//
//  347. 前 K 个高频元素.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/8.
//
/*
 思路1
 // 先统计频率
 // 以频率排序
 // 取出前k个元素
 */
import Foundation
class BinaryMinHeap {
    var count: Int = 0
    func replace() {
        
    }
    func add() {
        
    }
}
class Solution347 {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        // 统计频率
        var map: [Int: Int] = [:]
        for item in nums {
            if let num = map[item] {
                map[item] = num + 1
            } else {
                map[item] = 1
            }
        }
        // 如果构建一个固定元素的小顶堆
        let keys = map.keys
        var heap = BinaryMinHeap()
        for key in map.keys {
            if heap.count < k {
                // 还没有超过堆的最多元素
                heap.add()
            } else {
                // 已经到了最多元素
                heap.replace()
            }
        }
        return []
    }
    class func test() {
        let solution = Solution347()
        let nums = [1,1,1,2,2,3], k = 2
        let result = solution.topKFrequent(nums,k)
        print(result)
    }
}
