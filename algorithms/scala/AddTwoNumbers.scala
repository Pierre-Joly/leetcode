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

class ListNode(_x: Int = 0, _next: ListNode = null) {
   var next: ListNode = _next   var x: Int = _x
}

object Solution {
  def addTwoNumbers(l1: ListNode, l2: ListNode): ListNode = {
    def go(node1: ListNode, node2: ListNode, carry: Int): ListNode = {
      (node1, node2, carry) match {
        case (null, null, 0) => null
        case _ => {
          val sum = Option(node1).map(_.x).getOrElse(0) + Option(node2).map(_.x).getOrElse(0) + carry
          val newNode = new ListNode(sum % 10)
          newNode.next = go(Option(node1).flatMap(n => Option(n.next)).orNull,
                            Option(node2).flatMap(n => Option(n.next)).orNull,
                            sum / 10)
          newNode
        }
      }
    }
    go(l1, l2, 0)
  }
}

// Time complexity: The time complexity is O(N) because the algorithm traverses each node of both input linked lists once.
// Space complexity: The space complexity is O(N) because the algorithm outputs a list of length N or N+1.

/*
Explanation:

The algorithm traverses each node of both input linked lists once to perform the addition. 
*/
