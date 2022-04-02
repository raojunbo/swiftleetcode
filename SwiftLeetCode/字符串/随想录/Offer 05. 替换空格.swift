//
//  Offer 05. 替换空格.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/2.
//

import Foundation
class SolutionSword05 {
    func replaceSpace(_ s: String) -> String {
        var result: String = ""
        let sArray = Array(s)
        for c in sArray {
            if c == Character(" ") {
                result.append("%20")
            } else {
                result.append(String(c))
            }
        }
        return result
    }
    // 很好的思路
    func replaceSpace2(_ s: String) -> String {
        var strArr = Array(s)
        var count = 0
        
        // 统计空格的个数
        for i in strArr {
            if i == " " {
                count += 1
            }
        }
        // left 指向旧数组的最后一个元素
        var left = strArr.count - 1
        // right 指向扩容后数组的最后一个元素（这里还没对数组进行实际上的扩容）
        var right = strArr.count + count * 2 - 1
        
        // 实际对数组扩容
        for _ in 0..<(count * 2) {
            strArr.append(" ")
        }
        // 从后向前倒推。遇到" " 填写%20
        while left < right {
            if strArr[left] == " " {
                // 填写
                strArr[right] = "0"
                strArr[right - 1] = "2"
                strArr[right - 2] = "%"
                left -= 1
                right -= 3
            } else {
                // 复制
                strArr[right] = strArr[left]
                left -= 1
                right -= 1
            }
        }
        
        return String(strArr)
    }
    class func test() {
        let solution = SolutionSword05()
        let s = "We are happy."
        let result = solution.replaceSpace2(s)
        print(result)
    }
}
