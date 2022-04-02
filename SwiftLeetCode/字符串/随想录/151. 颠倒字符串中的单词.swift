//
//  151. 颠倒字符串中的单词.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/2.
//
// 1. 将里面的单词反转一次
// 2. 将整体反转一次
import Foundation
class Solution151 {
    func reverseWords(_ s: String) -> String {
        var array = Array(s)
        // 去除空白
        let length = trimSpace(array: &array)
        // 反转所有
        reverse(start: 0, end: length - 1, array: &array)
        print(array)
        // 每个单词反转
        var pre = 0
        for i in 0..<length {
            let c = array[i]
            // 遇见空格了
            if c == " " {
                reverse(start: pre, end: i - 1, array: &array)
                pre = i + 1
            }
            // 是最后一个了
            if i == length - 1 {
                reverse(start: pre, end: i, array: &array)
            }
        }
        var result = ""
        for i in 0..<length {
            result.append(array[i])
        }
        return result
    }
    // 去除空格后有效长度，这你比价容易出错
    func trimSpace(array: inout [Character]) -> Int {
        var slowIndex = 0 // 慢指针
        var pre: Character? // 记录前一个
        for c in array {
            // 第一字符是空格，快指针跳过
            if pre == nil && c == Character(" "){
                pre = c
                continue
            }
            // 前面的字符是" " ，且当前字符也是" "，快指针跳过
            if pre == Character(" ") && c == Character(" ") {
                pre = c
                continue
            }
            pre = c
            array[slowIndex] = c
            slowIndex += 1
        }
        // 当最后的一个是" "，且快指针为也为" "时，回退
        if array[slowIndex - 1] == " " {
            slowIndex -= 1
        }
        return slowIndex
    }
    // 反转起始点
    func reverse(start: Int, end: Int, array: inout [Character]) {
        var left = start
        var right = end
        while left < right {
            let tmp = array[left]
            array[left] = array[right]
            array[right] = tmp
            left += 1
            right -= 1
        }
    }
    class func test() {
        let solution = Solution151()
        let s = "  hello world  "
        let result = solution.reverseWords(s)
        print(result)
    }
}
