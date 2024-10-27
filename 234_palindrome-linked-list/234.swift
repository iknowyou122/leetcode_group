//
//  234.swift
//  
//
//  Created by 楊育昇 on 2024/10/27.
//

import Foundation

// 234

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var fast: ListNode? = head
        var slow: ListNode? = head
        
        // fast 到底 slow 到中間後同時向反方向比
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        if fast != nil {
            slow = slow?.next
        }
        slow = reverse(slow)
        fast = head
        while slow != nil {
            if fast?.val != slow?.val {
                return false
            }
            fast = fast?.next
            slow = slow?.next
        }
        
        return true
    }
    
    private func reverse(_ head: ListNode?) -> ListNode? {
        var head = head
        var pre: ListNode? = nil
    
        while head != nil {
            let next = head?.next
            head?.next = pre
            pre = head
            head = next
        }
        
        return pre
    }
}
