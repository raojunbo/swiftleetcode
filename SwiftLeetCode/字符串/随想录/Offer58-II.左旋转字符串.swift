//
//  Offer58-II.左旋转字符串.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/2.
//

import Foundation
// 将前面的字符串移动发面
// 将左边的反转
// 将右边的反转
// 将整体的反转
class SolutionSword58 {
    func reverseLeftWords(_ s: String, _ n: Int) -> String {
        var array = Array(s)
        let realN = n % s.count
        reverseRange(start: 0, end: realN - 1, array: &array)
        reverseRange(start: realN, end: array.count - 1, array: &array)
        reverseRange(start: 0, end: array.count - 1, array: &array)
        return String(array)
    }
    func reverseRange(start: Int, end: Int, array: inout [Character]) {
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
        let solution = SolutionSword58()
        let s = "abcdefg"
        let k = 2
        let result = solution.reverseLeftWords(s, k)
        print(result)
    }
}
