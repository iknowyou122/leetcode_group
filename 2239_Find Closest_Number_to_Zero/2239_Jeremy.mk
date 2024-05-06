class Solution {
    
    func findClosestNumber(_ nums: [Int]) -> Int {
        var ansSet: (ans: Int, distance: Int) = (ans: Int.max, distance: Int.max)
        guard nums.isEmpty == false else { return Int.max }
        
        nums.forEach { value in
            let dis = abs(0 - value)
            
            if dis < ansSet.distance {
                ansSet = (value, dis)
            } else if dis == ansSet.distance && value > ansSet.ans {
                ansSet = (value, dis)
            }
            
        }
        return ansSet.ans
    }
}
