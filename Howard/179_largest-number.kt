class Solution {
    fun largestNumber(nums: IntArray): String {
         val arr = arrayOfNulls<String>(nums.size)
        for (i in nums.indices) {
            arr[i] = Integer.toString(nums[i])
        }
        Arrays.sort(arr) { a, b ->
            (b + a).compareTo(a + b)
        }
        if (arr[0] == "0") return "0"
        val builder = StringBuilder()
        for (item in arr) {
            builder.append(item)
        }
        return builder.toString()
    }
}