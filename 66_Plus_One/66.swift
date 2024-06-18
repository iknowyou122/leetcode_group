//
//  66.swift
//  
//
//  Created by 楊育昇 on 2024/6/18.
//

import Foundation

//You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.
//
//Increment the large integer by one and return the resulting array of digits.
//
//
//
//Example 1:
//
//Input: digits = [1,2,3]
//Output: [1,2,4]
//Explanation: The array represents the integer 123.
//Incrementing by one gives 123 + 1 = 124.
//Thus, the result should be [1,2,4].
//Example 2:
//
//Input: digits = [4,3,2,1]
//Output: [4,3,2,2]
//Explanation: The array represents the integer 4321.
//Incrementing by one gives 4321 + 1 = 4322.
//Thus, the result should be [4,3,2,2].
//Example 3:

//Input: digits = [9]
//Output: [1,0]
//Explanation: The array represents the integer 9.
//Incrementing by one gives 9 + 1 = 10.
//Thus, the result should be [1,0].


class Solution {
    
    func plusOne(_ digits: [Int]) -> [Int] {
        
        var result = digits
        var i = digits.count - 1
        
        result[i] += 1
        
        while result[i] > 9 {
            if i == 0 {
                result.insert(1, at: 0)
                i += 1
            } else {
                result[i-1] += 1
            }
            result[i] = 0
            i -= 1
        }
        
        return result
    }
    
}
