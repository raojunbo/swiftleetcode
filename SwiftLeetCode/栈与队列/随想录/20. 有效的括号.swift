//
//  20. 有效的括号.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/6.
//
// 有效的括号
// 直接采用栈就可以实现
import Foundation
class Solution20 {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        for item in s {
            if let top = stack.last, checkMatch(top, b: item) {
                stack.removeLast()
            } else {
                stack.append(item)
            }
        }
        if stack.isEmpty {
            return true
        }
        return false
    }
    func checkMatch(_ a: Character, b: Character) -> Bool {
        if a == "(" && b == ")" {
            return true
        }
        if a == "{" && b == "}" {
            return true
        }
        if a == "["  && b == "]"{
            return true
        }
        return false
    }
    class func test() {
        let solution = Solution20()
        let str = "()[]{}"
        let result = solution.isValid(str)
        print(result)
    }
}
