import Foundation

//Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.
//
//If target is not found in the array, return [-1, -1].
//
//You must write an algorithm with O(log n) runtime complexity.
//
//
//
//Example 1:
//
//Input: nums = [5,7,7,8,8,10], target = 8
//Output: [3,4]
//Example 2:
//
//Input: nums = [5,7,7,8,8,10], target = 6
//Output: [-1,-1]
//Example 3:
//
//Input: nums = [], target = 0
//Output: [-1,-1]

//class Solution {
//    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
//
//        var startIdx = -1
//        var endIdx = -1
//
//        if nums.contains(target) {
//            startIdx = nums.firstIndex(of: target)!
//            endIdx = nums.lastIndex(of: target)!
//        }
//        return [startIdx, endIdx]
//    }
//}

class Solution {
    func searchRange(_ nums: [Int], _ t: Int) -> [Int] {
        var arr = [-1,-1]
        if nums.isEmpty { return arr }
        
        var lhs = 0, rhs = nums.count - 1
        // find left
        while lhs < rhs {
            let mid = lhs + (rhs - lhs) / 2
            nums[mid] < t ? (lhs = mid + 1) : (rhs = mid)
        }
        
        guard nums[lhs] == t else { return arr }
        arr[0] = lhs
        
        // find right
        rhs = nums.count - 1
        while lhs < rhs {
            let mid = lhs + (rhs - lhs) / 2 + 1
            nums[mid] > t ? (rhs = mid - 1) : (lhs = mid)
        }
        arr[1] = lhs
        return arr
    }
}

print(Solution().searchRange([5,7,7,8,8,10], 6))
