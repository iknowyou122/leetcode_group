//
//  121_best_time_to_buy_stock.swift
//  
//
//  Created by 楊育昇 on 2024/5/12.
//

import Foundation

//You are given an array prices where prices[i] is the price of a given stock on the ith day.
//
//You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
//
//Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
//
//
//
//Example 1:
//
//Input: prices = [7,1,5,3,6,4]
//Output: 5
//Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
//Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
//Example 2:
//
//Input: prices = [7,6,4,3,1]
//Output: 0
//Explanation: In this case, no transactions are done and the max profit = 0.
//
//
//Constraints:
//
//1 <= prices.length <= 105
//0 <= prices[i] <= 104

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var result = 0
        guard prices.count > 1 else { return result }
        var minP = prices[0]
        
        for index in 1...prices.count - 1 {
            let newP = prices[index]
            if newP <= minP {
                minP = newP
            } else {
                result = max(result, newP - minP)
            }
        }
        
        return result
    }
}

