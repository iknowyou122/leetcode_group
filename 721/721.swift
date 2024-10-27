//
//  721.swift
//  
//
//  Created by 楊育昇 on 2024/7/25.
//

import Foundation

//Given a list of accounts where each element accounts[i] is a list of strings, where the first element accounts[i][0] is a name, and the rest of the elements are emails representing emails of the account.
//
//Now, we would like to merge these accounts. Two accounts definitely belong to the same person if there is some common email to both accounts. Note that even if two accounts have the same name, they may belong to different people as people could have the same name. A person can have any number of accounts initially, but all of their accounts definitely have the same name.
//
//After merging the accounts, return the accounts in the following format: the first element of each account is the name, and the rest of the elements are emails in sorted order. The accounts themselves can be returned in any order.

//Example 1:
//
//Input: accounts = [["John","johnsmith@mail.com","john_newyork@mail.com"],["John","johnsmith@mail.com","john00@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]]
//Output: [["John","john00@mail.com","john_newyork@mail.com","johnsmith@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]]
//Explanation:
//The first and second John's are the same person as they have the common email "johnsmith@mail.com".
//The third John and Mary are different people as none of their email addresses are used by other accounts.
//We could return these lists in any order, for example the answer [['Mary', 'mary@mail.com'], ['John', 'johnnybravo@mail.com'],
//['John', 'john00@mail.com', 'john_newyork@mail.com', 'johnsmith@mail.com']] would still be accepted.
//Example 2:
//
//Input: accounts = [["Gabe","Gabe0@m.co","Gabe3@m.co","Gabe1@m.co"],["Kevin","Kevin3@m.co","Kevin5@m.co","Kevin0@m.co"],["Ethan","Ethan5@m.co","Ethan4@m.co","Ethan0@m.co"],["Hanzo","Hanzo3@m.co","Hanzo1@m.co","Hanzo0@m.co"],["Fern","Fern5@m.co","Fern1@m.co","Fern0@m.co"]]
//Output: [["Ethan","Ethan0@m.co","Ethan4@m.co","Ethan5@m.co"],["Gabe","Gabe0@m.co","Gabe1@m.co","Gabe3@m.co"],["Hanzo","Hanzo0@m.co","Hanzo1@m.co","Hanzo3@m.co"],["Kevin","Kevin0@m.co","Kevin3@m.co","Kevin5@m.co"],["Fern","Fern0@m.co","Fern1@m.co","Fern5@m.co"]]


class Solution {
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var emailRelation = [String: Set<String>]()
        var emailToName = [String: String]()
        
        buildGraph(accounts, &emailRelation, &emailToName)
        
        return dfs(emailRelation, emailToName)
    }
    
    private func buildGraph(_ accounts: [[String]],_ emailRelation: inout [String: Set<String>],_ emailToName: inout [String: String]) {
        for account in accounts {
            let name = account[0]
            let emails = Array(account[1...])
            let first = emails[0]
            
            for email in emails {
                emailRelation[first, default: []].insert(email)
                emailRelation[email, default: []].insert(first)
                emailToName[email] = name
            }
        }
    }
    
    private func dfs(_ emailRelation: [String: Set<String>],_ emailToName: [String: String]) -> [[String]] {
        var result: [[String]] = []
        var visited = Set<String>()
        
        for email in emailRelation.keys {
            if !visited.contains(email) {
                visited.insert(email)
                
                var stack: [String] = []
                var emailList: [String] = []
                
                stack.append(email)
                
                while !stack.isEmpty {
                    let em = stack.removeLast()
                    emailList.append(em)
                    
                    for neigbor in emailRelation[em]! where !visited.contains(neigbor) {
                        visited.insert(neigbor)
                        stack.append(neigbor)
                    }
                }
                
                result.append([emailToName[email]!] + emailList.sorted() )
                
            }
        }
        
        return result
    }
}

