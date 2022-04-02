//
//  344.反转字符串.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/2.
//

import Foundation
class Solution344 {
    func reverseString(_ s: inout [Character]) {
        var left = 0
        var right = s.count - 1
        while left < right {
            let tmp = s[left]
            s[left] = s[right]
            s[right] = tmp
            left += 1
            right -= 1
        }
    }
    class func test() {
        var s = Array("hello")
        let solution = Solution344()
        solution.reverseString(&s)
        print(s)
    }
}
