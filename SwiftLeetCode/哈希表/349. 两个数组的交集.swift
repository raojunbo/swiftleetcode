//
//  349. 两个数组的交集.swift
//  SwiftLeetCode
//
//  Created by junbo.rao on 2022/4/2.
//

import Foundation
class Solution349 {
    // 连个数组的交集
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var set:Set<Int> = []
        for item in nums1 {
            if set.contains(item) {
                continue
            }
            set.insert(item)
        }

        var set2: Set<Int> = []
        for item in nums2 {
            if set.contains(item) {
                set2.insert(item)
                continue
            }
        }
        
        return Array(set2)
    }
    class func test() {
        let solution = Solution349()
        
        let nums1 = [4,7,9,7,6,7]
        let nums2 =  [5,0,0,6,1,6,2,2,4]
        let result = solution.intersection(nums1, nums2)
        print(result)
    }
}
