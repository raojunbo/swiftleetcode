//
//  202. 快乐数.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/2.
//
// 思路，不会出现循环就一定能是算出1
import Foundation
class Solution202 {
    func isHappy(_ n: Int) -> Bool {
        var set = Set<Int>()
        var n = n
        while true {
            // 是快乐数
            if n == 1 {
                break
            }
            // 已经循环了
            if set.contains(n) {
                return false
            }
            set.insert(n)
            // 重新算值
            var sum = 0
            var k = n
            while k != 0 {
                let one = k % 10
                sum += one * one
                k = k / 10
            }
            n = sum
        }
        return true
    }
    class func test() {
        let solution = Solution202()
        let result = solution.isHappy(2)
        print(result)
    }
}
