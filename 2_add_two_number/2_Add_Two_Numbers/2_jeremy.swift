//
//  2.swift
//  
//
//  Created by 楊育昇 on 2024/6/2.
//

import Foundation
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var list1 = l1
        var list2 = l2
        let prehead = ListNode()
        var currentNode = prehead
        var carry = 0
        while list1 != nil || list2 != nil || carry != 0 {
            var sum = (list2?.val ?? 0) + (list1?.val ?? 0)
            sum += carry
            let node = ListNode(sum % 10)
            currentNode.next = node
            currentNode = node
            carry = sum / 10
            list1 = list1?.next
            list2 = list2?.next
        }
        return prehead.next
    }
}
