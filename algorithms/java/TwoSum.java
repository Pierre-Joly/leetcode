// Title : Two Sum
// Source : https://leetcode.com/problems/two-sum/
// Author: Pierre Joly
// Date: 2024-04-16 (YYYY-MM-DD)
// ID: 1
// Difficulty: Easy

/******************************************************************************
# Description :

Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
You may assume that each input would have exactly one solution, and you may not use the same element twice.
You can return the answer in any order.

## Example 1:

Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

## Example 2:

Input: nums = [3,2,4], target = 6
Output: [1,2]

## Example 3:

Input: nums = [3,3], target = 6
Output: [0,1]
 
## Constraints:

2 <= nums.length <= 104
-109 <= nums[i] <= 109
-109 <= target <= 109
Only one valid answer exists.

## Follow-up: Can you come up with an algorithm that is less than O(n2) time complexity?
******************************************************************************/

import java.util.HashMap;
import java.util.Map;

public class Solution {
    public int[] twoSum(int[] nums, int target) {
        Map<Integer, Integer> seen = new HashMap<>();
        for (int i = 0; i < nums.length; i++) {
            int num = nums[i];
            int diff = target - num;
            if (seen.containsKey(diff)) {
                return new int[] {seen.get(diff), i};
            }
            seen.put(num, i);
        }
        return new int[] {};
    }
}

// Time complexity: O(n) because we traverse the array once and each map operation is O(1) on average.
// Space complexity: O(n) as in the worst case, we store all elements in the map.

/*
Explanation:

This method leverages a hash table to track each number's index as we iterate through the list. By calculating the 
complement (target - current number), we can check if this complement has already been encountered with a constant 
time complexity hash table lookup. If the complement exists, it means we previously stored a number such that 
together with the current number, they sum to the target. This approach ensures that we check each number at most 
once, achieving a time complexity of O(n). The space complexity is also O(n), as we might need to store all numbers 
in the hash table in the worst case scenario.
*/