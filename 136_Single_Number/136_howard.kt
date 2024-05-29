fun singleNumber(nums: IntArray): Int {
        val counts = HashMap<Int, Int>()
        for (num in nums) {
            counts[num] = counts.getOrDefault(num, 0) + 1
        }
        for (num in counts) {
            if (num.value == 1) {
                return num.key
            }
        }
    return -1
    }