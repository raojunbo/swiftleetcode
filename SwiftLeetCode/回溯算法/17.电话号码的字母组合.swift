//
//  17.电话号码的字母组合.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/14.
//
// 回溯方法的核心
import Foundation
class Solution17 {
    var path: [String] = []
    var result: [String] = []
    var digitMap = [
        "2": ["a","b","c"],
        "3": ["d","e","f"],
        "4": ["g", "h", "i"],
        "5": ["j", "k", "l"],
        "6": ["m","n","o"],
        "7": ["p","q","r","s"],
        "8": ["t","u","v"],
        "9": ["w","x","y","z"]
    ]
    func letterCombinations(_ digits: String) -> [String] {
        var digitsArray: [String] = []
        for digit in Array(digits) {
            digitsArray.append(String(digit))
        }
        if digitsArray.count == 0 {
            return result
        }
        combinations(digitsArray: digitsArray, index: 0)
        return result
    }
    func combinations(digitsArray: [String], index: Int) {
        if index == digitsArray.count {
            result.append(path.joined())
            return
        }
        let cs = digitMap[digitsArray[index]]!
        for i in 0..<cs.count {
            path.append(cs[i])
            combinations(digitsArray: digitsArray, index: index + 1)
            path.removeLast()
        }
    }
    class func test() {
        let solution = Solution17()
        let digits = ""
        let result = solution.letterCombinations(digits)
        print(result)
    }
}
