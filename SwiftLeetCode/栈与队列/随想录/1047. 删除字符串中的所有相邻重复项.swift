//
//  1047. 删除字符串中的所有相邻重复项.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/6.
//
//
import Foundation
class Solution1047 {
    func removeDuplicates(_ s: String) -> String {
        var stack: [Character] = []
        let sArray = Array(s)
        for item in sArray {
            if let top = stack.last, top == item {
                stack.removeLast()
            } else {
                stack.append(item)
            }
        }
        return String(stack)
    }
    class func test() {
        let str = "abbaca"
        let solution = Solution1047()
        let result = solution.removeDuplicates(str)
        print(result)
    }
}
