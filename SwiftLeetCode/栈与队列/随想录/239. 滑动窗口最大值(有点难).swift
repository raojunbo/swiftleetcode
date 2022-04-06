//
//  239. 滑动窗口最大值.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/6.
//
// 滑动窗口的最大值
// 滑动窗口， 单调队列
import Foundation
// 单调队列，由大到小
class SigleUpQueue {
    var queue: [Int] = []
    var maxSize: Int = 0
    func push(x: Int) {
        if queue.isEmpty {
            queue.append(x)
        } else {
            if let last = queue.last, last < x {
                queue.removeAll()
            }
            queue.append(x)
        }
        // 查看是否超出区域
        if queue.count > maxSize {
            while queue.count > maxSize {
                queue.removeFirst()
            }
        }
    }
    func pop() -> Int {
        return queue.removeFirst()
    }
    func top() -> Int {
        return queue.first!
    }
}
class Solution239 {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        let queue = SigleUpQueue()
        queue.maxSize = k
        var result: [Int] = []
        for (index, item) in nums.enumerated() {
            queue.push(x: item)
            if index >= k - 1 {
                result.append(queue.top())
            }
        }
        return result
    }

    class func test() {
        let solution = Solution239()
        let nums = [1,3,1,2,0,5]
        let k = 3
        let result = solution.maxSlidingWindow(nums, k)
        print(result)
    }
}
