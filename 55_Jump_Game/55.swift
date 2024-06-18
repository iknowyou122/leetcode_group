//
//  55.swift
//  
//
//  Created by 楊育昇 on 2024/6/18.
//

import Foundation

//You are given an integer array nums. You are initially positioned at the array's first index, and each element in the array represents your maximum jump length at that position.
//
//Return true if you can reach the last index, or false otherwise.
//
//
//
//Example 1:
//
//Input: nums = [2,3,1,1,4]
//Output: true
//Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
//Example 2:
//
//Input: nums = [3,2,1,0,4]
//Output: false
//Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.
//
//
//Constraints:
//
//1 <= nums.length <= 104
//0 <= nums[i] <= 105

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        // 最遠可達的指針
        var far = 0
        for (idx, num) in nums.enumerated() {
            // 當 idx 超過最遠指針就表示沒有方法可以跳到該 index
            if idx > far { return false }
            far = max(far, idx + num)
        }
        // 確保每個 index 都能到就可以 return true
        return true
    }
}

