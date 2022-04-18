//
//  93.复原IP地址.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/14.
//
// 本题实际上还是不断通过回溯去尝试。
import Foundation
class Solution93 {
    var part: [String] = []
    var result: [String] = []
    func restoreIpAddresses(_ s: String) -> [String] {
        tryIpAddress(ss: Array(s), start: 0)
        return result
    }
    func tryIpAddress(ss: [Character], start:Int) {
        for i in start..<ss.count {
            // start 到 i 是否是有效的ip
            if !isValid(s: ss, start: start, end: i) {
                return
            }
            // 已经有超过4个的分片了
            if part.count > 4 {
                return
            }
            part.append(String(ss[start...i]))
            // 切好是4个分片，且是到终点了
            if part.count == 4  && i == ss.count - 1 {
                result.append(part.joined(separator: "."))
                part.removeLast()
                continue
            }
            tryIpAddress(ss: ss, start: i + 1)
            part.removeLast()
        }
    }
    func isValid( s: [Character], start: Int, end: Int) -> Bool {
        if (start > end) {
            return false;
        }
        // 0开头的数字不合法
        if (s[start] == "0" && start != end) {
            return false;
        }
        // 计算数值
        var num = 0;
        for i in start...end {
            if (s[i] > "9"  || s[i] < "0" ) { // 遇到⾮数字字符不合法
                return false;
            }
            // 字符的相差值
            let si =  (String(s[i]) as NSString).intValue
            num = num * 10 + Int(si);
            if (num > 255) { // 如果⼤于255了不合法
                return false;
            }
        }
        return true;
    }
    class func test() {
        let solution = Solution93()
        let s =  "101023"
        let result = solution.restoreIpAddresses(s)
        print(result)
    }
}
