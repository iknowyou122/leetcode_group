class Solution {
    fun removeDuplicates(nums: IntArray): Int {
        var resultIndex = 1
        for (i in 1 until nums.size){
            if (nums[i] != nums[i - 1]){
                nums[resultIndex] = nums[i]
                resultIndex++
            }
        }
        return resultIndex
    }
}