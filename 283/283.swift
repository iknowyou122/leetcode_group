//
//  283.swift
//  
//
//  Created by 楊育昇 on 2024/10/27.
//

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var i = 0, zero = 0
        while i < nums.count - zero {
            if nums[i] == 0 {
                zero += 1
                nums.append(0)
                nums.remove(at: i)
            } else {
                i += 1
            }
        }
    }
}
