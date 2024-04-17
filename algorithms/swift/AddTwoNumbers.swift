// Title : Add Two Numbers
// Source : https://leetcode.com/problems/add-two-numbers/
// Author: Pierre Joly
// Date: 2024-04-17 (YYYY-MM-DD)
// ID: 2
// Difficulty: Medium

/*
# Description :

You are given two non-empty linked lists representing two non-negative integers. The digits
are stored in reverse order, and each of their nodes contains a single digit. Add the two
numbers and return the sum as a linked list. You may assume the two numbers do not contain
any leading zero, except the number 0 itself.
 
Example 1:

Input: l1 = [2,4,3], l2 = [5,6,4]
Output: [7,0,8]
Explanation: 342 + 465 = 807.
Example 2:

Input: l1 = [0], l2 = [0]
Output: [0]
Example 3:

Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
Output: [8,9,9,9,0,0,0,1]
 

Constraints:

The number of nodes in each linked list is in the range [1, 100].
0 <= Node.val <= 9
It is guaranteed that the list represents a number that does not have leading zeros.
*/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
final class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy_head = ListNode()
        var current = dummy_head
        var carry = 0
        var node1 = l1, node2 = l2

        while node1 != nil || node2 != nil || carry != 0 {
            let val1 = node1?.val ?? 0
            let val2 = node2?.val ?? 0
            let sum = val1 + val2 + carry

            carry = sum / 10
            current.next = ListNode(sum % 10)
            current = current.next!

            node1 = node1?.next
            node2 = node2?.next
        }
        return dummy_head.next
    }
}

// Time complexity: The time complexity is O(N) because the algorithm traverses each node of both input linked lists once.
// Space complexity: The space complexity is O(N) because the algorithm outputs a list of length N or N+1.

/*
Explanation:

The algorithm traverses each node of both input linked lists once to perform the addition. 
*/
