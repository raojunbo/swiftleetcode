//
//  第77题. 组合.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/13.
//
// 要想求组合的问题
import Foundation
class Solution77 {
    var path: [Int] = []
    var result: [[Int]] = []
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        combineone(start: 1, n: n,k: k)
        return result
    }
    func combineone(start: Int, n: Int, k: Int) {
        // 收集结果
        if path.count == k {
            result.append(path)
            return
        }
      
        for i in start...n {
            // 当前节点+还需要的元素大于了n，后面的元素不够了
            if i + (k - path.count) - 1  > n {
                return
            }
            path.append(i)
            combineone(start: i + 1, n: n, k: k)
            path.removeLast()
        }
    }
    class func test() {
        let solution = Solution77()
        let n = 4, k = 2
        let result = solution.combine(n, k)
        print(result)
    }
}
