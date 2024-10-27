//
//  151.swift
//  
//
//  Created by 楊育昇 on 2024/10/27.
//

import Foundation

class Solution {
    func reverseWords(_ s: String) -> String {
        s.split(separator: " ").reversed().joined(separator: " ")
    }
}
