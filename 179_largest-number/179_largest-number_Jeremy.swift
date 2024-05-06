//
//  179_largest-number.swift
//  
//
//  Created by 楊育昇 on 2024/5/5.
//

import Foundation

//Given a list of non-negative integers nums, arrange them such that they form the largest number and return it.
//
//Since the result may be very large, so you need to return a string instead of an integer.
//
//
//
//Example 1:
//
//Input: nums = [10,2]
//Output: "210"
//Example 2:
//
//Input: nums = [3,30,34,5,9,96]
//Output: "9534330"
//
//
//Constraints:
//
//1 <= nums.length <= 100
//0 <= nums[i] <= 109

class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        var strs = nums.map { String($0) }
        strs.sort { $0 + $1 > $1 + $0 }
        if strs.first == "0" {
            return "0"
        }
        return strs.reduce("") { partialResult, str in
            partialResult + str
        }
    }
}
