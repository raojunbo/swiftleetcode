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
    // Swift的使用数组会超时，其他语言没有超时。
    var data: [Int] = []
    // 每次入队时，要移除它前面的小于最新的值。
    func push(_ x: Int) {
        if data.isEmpty {
            data.append(x)
        } else {
            while !data.isEmpty, x > data.last! {
                data.removeLast()
            }
            data.append(x)
        }
    }
    // 每次要弹出的值是否与队列顶部的值相等,相等就弹出。也就是他要失效了
    func pop(_ x: Int) {
        if !data.isEmpty && x == data.first {
            data.removeFirst()
        }
    }
    func front() -> Int {
        return data.first!
    }
}
class Solution239 {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        let queue = SigleUpQueue()
      
        var result: [Int] = []
        for index in 0..<min(k, nums.count) {
            queue.push(nums[index])
        }
        result.append(queue.front())
        
        if k > nums.count {
            return result
        }
        for index in k..<nums.count {
            let item = nums[index]
            queue.push(item)
            queue.pop(nums[index - k])
            result.append(queue.front())
        }
        return result
    }
    
    class func test() {
        let solution = Solution239()
        let nums = [1,3,-1,-3,5,3,6,7]
        let k = 3
        let result = solution.maxSlidingWindow(nums, k)
        print(result)
    }
}
