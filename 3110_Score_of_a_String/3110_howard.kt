class Solution {
    fun scoreOfString(s: String): Int {
         var answer = 0
        for (i in 1 until s.length) {
            answer += Math.abs(s[i-1].code - s[i].code)
        }
        return answer
    }
}