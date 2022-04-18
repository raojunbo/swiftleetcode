//
//  216. 组合总和 III.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/14.
//

import Foundation
class Solution216 {
    var path: [Int] = []
    var result: [[Int]] = []
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        combination(n: n, k: k, start: 1)
        return result
    }
    func combination(n: Int, k: Int, start: Int) {
        if k == path.count && n == 0 {
            result.append(path)
            return
        }
        if start > 9 {
            return
        }
        for i in start...9 {
            // 剩下的数据个数已经不够了
            if i + (k - path.count) - 1 > 9 {
                return
            }
            // 如果数目已经比k大了，不用继续了
            if path.count >= k {
                return
            }
            // 已经超出了范围，后面的不用继续了
            if n < 0 {
                return
            }
            path.append(i)
            // start: i + 1 表示只能使用一次
            combination(n: n - i, k: k, start: i + 1)
            path.removeLast()
        }
    }
    class func test() {
        let solution = Solution216()
        let  k = 3, n = 9
        let result = solution.combinationSum3(k, n)
        print(result)
    }
}
