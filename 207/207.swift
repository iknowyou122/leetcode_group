//
//  207.swift
//  
//
//  Created by 楊育昇 on 2024/6/23.
//

import Foundation

//There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.
//
//For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
//Return true if you can finish all courses. Otherwise, return false.
//
//
//
//Example 1:
//
//Input: numCourses = 2, prerequisites = [[1,0]]
//Output: true
//Explanation: There are a total of 2 courses to take.
//To take course 1 you should have finished course 0. So it is possible.
//Example 2:
//
//Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
//Output: false
//Explanation: There are a total of 2 courses to take.
//To take course 1 you should have finished course 0, and to take course 0 you should also have finished course 1. So it is impossible.


class Solution {
    
    struct Edge {
        var source: Int
        var destination: Int
        
        init(mustTake source: Int, beforeTaking destination: Int) {
            self.source = source
            self.destination = destination
        }
    }
    
    
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        
        /// 0. Handle empty case
        if numCourses == 0 || prerequisites.isEmpty { return true }
        
        /// 0.5. Convert each subarray to an Edge structure for sake of readability
        let prerequisites = prerequisites.map { edge in Edge(mustTake: edge[1], beforeTaking: edge[0]) }
        
        /// 1. Convert from list of edges to indegree of adjacency list
        var inDegree = Array(repeating: 0, count: numCourses)
        for i in 0 ..< prerequisites.count { inDegree[prerequisites[i].destination] += 1 }
        
        /// 2. Setup the queue
        ///  - Start by adding all courses **without prerequisites** to the queue
        var queue = [Int]()
        for i in 0 ..< numCourses where inDegree[i] == 0 { queue.append(i) }
        var canFinishCount = queue.count
        
        /// 3. Take each course in FIFO order while updating the prerequisites. If it has no in-degree, take it.
        while !queue.isEmpty {
            
            /// 3.a. Indicate we've just completed a course by removing it from the queue
            let lastCompletedCourse = queue.removeFirst()
            
            /// 3.b. Update the remaining prerequisites for courses that depend on the course we just completed
            for edge in prerequisites where edge.source == lastCompletedCourse {
                let course = edge.destination
                inDegree[course] -= 1
                
                // 3.c. If the course has no in-degree, take the course
                if inDegree[course] == 0 {
                    canFinishCount += 1
                    queue.append(course)
                }
            }
        }
        return canFinishCount == numCourses
    }
}

