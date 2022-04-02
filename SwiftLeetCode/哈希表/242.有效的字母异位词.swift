//
//  242.有效的字母异位词.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/1.
//
// 每个字母出现的次数相同则为字母异位词
// 这里因为数字个数是固定的。所以可以用一个有限的字符数组
import Foundation
class Solution242 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        var record =  Array(repeating: 0, count: 26)
        let aUnicodeScalarsValue = "a".unicodeScalars.first!.value
        for c in s.unicodeScalars {
            record[Int(c.value - aUnicodeScalarsValue)] += 1
        }
        for c in t.unicodeScalars {
            record[Int(c.value - aUnicodeScalarsValue)] -= 1
        }
        for value in record {
            if value != 0 {
                return false
            }
        }
        return true
    }
    class func test() {
        let solution = Solution242()
        let s = "anagram"
        let t = "nagaram"
        let result = solution.isAnagram(s, t)
        print(result)
    }
}
