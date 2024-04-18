// Title : Longest Substring Without Repeating Characters (LSWRC)
// Source : https://leetcode.com/problems/longest-substring-without-repeating-characters/
// Author: Pierre Joly
// Date: 2024-04-18 (YYYY-MM-DD)
// ID: 3
// Difficulty: Medium

/*
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

*/

import java.util.HashMap;
import java.util.Map;

class Solution {
    public int lengthOfLongestSubstring(String s) {
    int[] char_indices = new int[256];
    arrays.fill(char_indices, -1);
    int max_length = 0;
    int left = 0;

    for (int right = 0; right < s.length(); right++) {
        int index = s.charAt(right);
        if (char_indices[index] >= left) {
            left = char_indices[index] + 1;
        }
        char_indices[index] = right;
        max_length = Math.max(max_length, right - left + 1);
    }

    return max_length;
}
}


// Time complexity : O(n), where n is the length of the string, because each character in the string is processed exactly once. The direct indexing into the array allows for O(1) time complexity for updating and checking the last seen positions of characters, making this method highly efficient.
// Space complexity : O(1), or more specifically O(m), where m is the fixed size of the character set (such as 256 for extended ASCII). This fixed space requirement does not scale with the size of the input string but is instead constant, reflecting the bounded nature of the ASCII character set.

/*
Explanation:

This method employs a fixed-size array (or vector) to track the last seen positions of each character, assuming the input string consists only of ASCII characters. This array acts like a direct access table, where the index represents the character, and the value at each index represents the last seen position of that character in the string.

The primary goal is to maintain a sliding window that contains no repeated characters. We utilize two pointers, `left` and `right`, which define the bounds of the current window of the substring without duplicates. As we iterate through the string:
- Each character's ASCII value is used to check its last occurrence directly from the array.
- If the character was previously seen and its recorded position is within the bounds of the current window (`left` to `right`), the `left` pointer is adjusted to just after the last occurrence of this character. This adjustment effectively removes the duplicate character from the current window.
- The current position of `right` is then recorded as the new last seen position of the character in the array.

This strategy allows us to always maintain a window without repeating characters by moving the `left` pointer intelligently whenever a duplicate is detected. The length of the current window is calculated as `right - left + 1`, and we continuously update `max_length` to ensure it holds the maximum length encountered during the traversal.
*/
