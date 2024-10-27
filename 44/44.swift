//
//  44.swift
//  
//
//  Created by 楊育昇 on 2024/10/27.
//

import Foundation

class Solution {
    func compress(_ chars: inout [Character]) -> Int {
        var index = 0
        var i = 0
    while i < chars.count {
        var j = i + 1
        while j < chars.count && chars[j] == chars[i] {
            j += 1
        }
        chars[index] = chars[i]
        index += 1
        if j - i > 1 {
            for c in String(j - i) {
                chars[index] = c
                index += 1
            }
        }
        i = j
    }
    return index
    }
}
