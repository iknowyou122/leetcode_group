//
//  137.swift
//  
//
//  Created by 楊育昇 on 2024/5/28.
//

import Foundation

//Given an integer array nums where every element appears three times except for one, which appears exactly once. Find the single element and return it.
//
//You must implement a solution with a linear runtime complexity and use only constant extra space.
//
//
//
//Example 1:
//
//Input: nums = [2,2,3,2]
//Output: 3
//Example 2:
//
//Input: nums = [0,1,0,1,0,1,99]
//Output: 99
//
//
//Constraints:
//
//1 <= nums.length <= 3 * 104
//-231 <= nums[i] <= 231 - 1
//Each element in nums appears exactly three times except for one element which appears once.

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var dict = [Int : Int]()
        for i in nums{
            dict.updateValue((dict[i] ?? 0)+1, forKey :i)
        }
        for (num,numCount) in dict where numCount == 1{
            return num
        }
        return 0
    }
}

