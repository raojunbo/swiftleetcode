//
//  541. 反转字符串II.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/2.
//

import Foundation
class Solution541 {
    // 模拟反转就可以了
    func reverseStr(_ s: String, _ k: Int) -> String {
        if k <= 1 {
            return s
        }
        var ss = Array(s)
        var start = 0
        var end = k - 1
        while true {
            if start >= ss.count {
                break
            }
            // 只交换制定的部分
            swap(start: start, end: end, s: &ss)
            start = start + k * 2
            end = start + k - 1
        }
        return String(ss)
    }
    func swap(start: Int, end: Int, s: inout [Character]) {
        var left = start
        var right = end
        if right >= s.count {
            right = s.count - 1
        }
        while left < right {
            let tmp = s[left]
            s[left] = s[right]
            s[right] = tmp
            left += 1
            right -= 1
        }
    }
    class func test() {
        let solution = Solution541()
        let s = "abcdefgq", k = 3
        let result = solution.reverseStr(s, k)
        print(result)
    }
}
