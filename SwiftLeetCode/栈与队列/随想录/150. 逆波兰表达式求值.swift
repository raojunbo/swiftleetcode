//
//  150. 逆波兰表达式求值.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/6.
//
// 表达式求
// 遇到符号求值
import Foundation
class Solution150 {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack: [Int] = []
        for item in tokens {
            if let v = Int(item) {
                stack.append(v)
            } else {
                var res = 0
                let two = stack.removeLast()
                let one = stack.removeLast()
                switch item {
                case "+":
                    res = one + two
                case "-":
                    res = one - two
                case "*":
                    res = one * two
                case "/":
                    res = one / two
                default:
                    break
                }
                stack.append(res)
            }
        }
        return stack.last!
    }
    class func test() {
        let solution = Solution150()
        let strArray =  ["4","13","5","/","+"]
        let result =  solution.evalRPN(strArray)
        print(result)
    }
}
