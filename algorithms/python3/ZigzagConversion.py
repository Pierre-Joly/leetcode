# Title : Zigzag Conversion
# Source : https://leetcode.com/problems/zigzag-conversion/
# Author: Pierre Joly
# Date: 2024-04-22 (YYYY-MM-DD)
# ID: 6
# Difficulty: Medium

"""
# Description :
The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

P   A   H   N
A P L S I I G
Y   I   R
And then read line by line: "PAHNAPLSIIGYIR"

Write the code that will take a string and make this conversion given a number of rows:

string convert(string s, int numRows);
 
Example 1:

Input: s = "PAYPALISHIRING", numRows = 3
Output: "PAHNAPLSIIGYIR"

Example 2:
Input: s = "PAYPALISHIRING", numRows = 4
Output: "PINALSIGYAHRPI"

Explanation:
P     I    N
A   L S  I G
Y A   H R
P     I

Example 3:
Input: s = "A", numRows = 1
Output: "A"

Constraints:

1 <= s.length <= 1000
s consists of English letters (lower-case and upper-case), ',' and '.'.
1 <= numRows <= 1000

"""

class Solution:
    def convert(self, s: str, numRows: int) -> str:
        if numRows == 1 or numRows >= len(s):
            return s
        
        rows = [''] * numRows
        current_row = 0
        going_down = False

        for char in s:
            rows[current_row] += char
            if current_row == 0 or current_row == numRows - 1:
                going_down = not going_down
            current_row += 1 if going_down else -1
        
        return ''.join(rows)

# Time Complexity: O(n) where n is the length of string s
# Space Complexity: O(n) for storing the zigzag conversion

"""
Explanation:

The solution involves initializing a list of strings for each row and determining the direction of traversal
(down or up) across these rows. This direction flips whenever the top or the bottom of the row list is reached.
Each character of the input string is appended to the appropriate row based on the current row index.
The row index is incremented or decremented depending on whether the direction is down or up, respectively.
When all characters have been placed into their respective rows according to the zigzag pattern, the rows are
concatenated into a single string to produce the final result. The algorithm ensures that each character of the
input string is processed exactly once, resulting in a time complexity of O(n), where n is the length of the string.
The space complexity is also O(n) because, in the worst case, the entire string is stored in the row structures.
"""