// Title : Longest Palindromic Substring
// Source : https://leetcode.com/problems/longest-palindromic-substring/
// Author: Pierre Joly
// Date: 2024-04-22 (YYYY-MM-DD)
// ID: 5
// Difficulty: Medium

/*
# Description :
Given a string s, return the longest palindromic substring in s.

Example 1:

Input: s = "babad"
Output: "bab"
Explanation: "aba" is also a valid answer.
Example 2:

Input: s = "cbbd"
Output: "bb"
 

Constraints:

1 <= s.length <= 1000
s consist of only digits and English letters.

*/



// Time complexity : O(n) each position in the transformed string being visited a limited number of times.
// Space complexity: O(n) to accommodate the `palindrome_radius` array and the transformed string storage.

/*
Explanation:

This solution uses Manacher's Algorithm, a highly efficient algorithm designed to find the longest palindromic substring
in linear time. The algorithm works by transforming the input string `s` into a new format that intersperses the original
characters with a separator (`#`). This transformation allows the algorithm to uniformly handle palindromes of both odd
and even lengths.

Key steps include:
1. Expanding around each potential center while maintaining an array `palindrome_radius` that tracks the radius (half-length)
of palindromes centered at each position.
2. Using previously computed information (`right_boundary` and `mirror`) to avoid unnecessary re-computation and thus optimize
the palindrome expansion process.
3. Once the longest palindrome is identified through the `palindrome_radius`, it calculates the starting index of this palindrome
in the original string and returns the substring.
*/