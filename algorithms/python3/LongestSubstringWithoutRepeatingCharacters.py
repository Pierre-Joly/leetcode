# Title : Longest Substring Without Repeating Characters (LSWRC)
# Source : https://leetcode.com/problems/longest-substring-without-repeating-characters/
# Author: Pierre Joly
# Date: 2024-04-18 (YYYY-MM-DD)
# ID: 3
# Difficulty: Medium

"""
# Description :

Given a string s, find the length of the longest substring without repeating characters.

Example 1:
Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.

Example 2:
Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.

Example 3:
Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.

Constraints:

0 <= s.length <= 5 * 104
s consists of English letters, digits, symbols and spaces.

"""

class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        char_map = {}
        left = 0
        max_length = 0

        for right in range(len(s)):
            if s[right] in char_map and char_map[s[right]] >= left:
                left = char_map[s[right]] + 1
            char_map[s[right]] = right
            max_length = max(max_length, right - left + 1)

        return max_length

# Time complexity: O(n) because we traverse the string once and each look-up in the table is O(1) on average.
# Space complexity: O(min(m, n)) as in the worst case, we store one of each unique character in the hash table, where m is the character set size.

"""
Explanation:

This method employs a hash table to track the last seen position of each character as we iterate through the string.
The primary goal is to maintain a sliding window that contains no repeated characters. We utilize two pointers, `left` 
and `right`, which define the current window of the substring without duplicates. Each time we encounter a character,
we check if it's in the hash table and whether its index is within the current window bounds defined by `left`. If it is,
we adjust the `left` pointer to the index right after the last occurrence of this character, effectively removing the
repeated character from our current window. 

This allows us to always maintain a window without repeating characters by moving the `left` pointer intelligently.
The length of the current window is calculated as `right - left + 1`, and we continuously update `max_length` to store 
the maximum length encountered. The time complexity is O(n) because each character is checked once, and the hash table 
operations (insert and check) are O(1) on average. The space complexity is O(min(m, n)), where m is the size of the
character set, which could potentially be all unique characters in the string, but is typically less and bounded by
the size of the character set.
"""
