//
//  153.swift
//  
//
//  Created by 楊育昇 on 2024/7/1.
//

import Foundation

//Suppose an array of length n sorted in ascending order is rotated between 1 and n times. For example, the array nums = [0,1,2,4,5,6,7] might become:
//
//[4,5,6,7,0,1,2] if it was rotated 4 times.
//[0,1,2,4,5,6,7] if it was rotated 7 times.
//Notice that rotating an array [a[0], a[1], a[2], ..., a[n-1]] 1 time results in the array [a[n-1], a[0], a[1], a[2], ..., a[n-2]].
//
//Given the sorted rotated array nums of unique elements, return the minimum element of this array.
//
//You must write an algorithm that runs in O(log n) time.
//
//

class Solution {
    
    func findMin(_ nums: [Int]) -> Int {
        return findMinArr(nums)
    }
    
    private func findMinArr(_ nums: [Int]) -> Int {


        // only two element
        if nums.count == 2 {
            return nums.min()!
        }else if nums.count == 1 {
            return nums[0]
        }
        
        // sorted arr
        if nums.first! < nums.last! {
            return nums.first!
        }
        
        // rotated array
        return min(findMinArr(Array(nums[0...nums.count / 2])), findMinArr(Array(nums[nums.count / 2 + 1...nums.count - 1])))
        
    }
    
}
