//
//  131.分割回文串.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/14.
//
// 分割字符串的问题
import Foundation
class Solution131 {
    var parts: [String] = []
    var result: [[String]] = []
    func partition(_ s: String) -> [[String]] {
        let array = Array(s)
        tpartiton(array, start: 0)
        return result
    }
    func tpartiton(_ s: [Character], start: Int) {
        if start == s.count {
            result.append(parts)
            return
        }
        for i in start..<s.count {
            if !isHuiWen(s, start: start, end: i) {
                continue
            }
            parts.append(String(s[start...i]))
            tpartiton(s, start: i + 1)
            parts.removeLast()
        }
    }
    func isHuiWen(_ s: [Character], start: Int, end: Int) -> Bool {
        var left = start
        var right = end
        var huiwen = true
        while left <= right {
            if s[left] != s[right] {
                huiwen = false
                break
            }
            left += 1
            right -= 1
        }
        return huiwen
    }
    class func test() {
        let solution = Solution131()
        let s = "efe"
        let result = solution.partition(s)
        print(result)
    }
}
