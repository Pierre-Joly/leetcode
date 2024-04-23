// Title : Reverse Integer
// Source : https://leetcode.com/problems/string-to-integer-atoi/
// Author: Pierre Joly
// Date: 2024-04-23 (YYYY-MM-DD)
// ID: 8
// Difficulty: Medium

/*
# Description :

Implement the myAtoi(string s) function, which converts a string to a 32-bit signed integer (similar to C/C++'s atoi function).

The algorithm for myAtoi(string s) is as follows:

Read in and ignore any leading whitespace.
Check if the next character (if not already at the end of the string) is '-' or '+'. Read this character in if it is either. This determines if the final result is negative or positive respectively. Assume the result is positive if neither is present.
Read in next the characters until the next non-digit character or the end of the input is reached. The rest of the string is ignored.
Convert these digits into an integer (i.e. "123" -> 123, "0032" -> 32). If no digits were read, then the integer is 0. Change the sign as necessary (from step 2).
If the integer is out of the 32-bit signed integer range [-231, 231 - 1], then clamp the integer so that it remains in the range. Specifically, integers less than -231 should be clamped to -231, and integers greater than 231 - 1 should be clamped to 231 - 1.
Return the integer as the final result.
Note:

Only the space character ' ' is considered a whitespace character.
Do not ignore any characters other than the leading whitespace or the rest of the string after the digits.
 

Example 1:

Input: s = "42"
Output: 42
Explanation: The underlined characters are what is read in, the caret is the current reader position.
Step 1: "42" (no characters read because there is no leading whitespace)
         ^
Step 2: "42" (no characters read because there is neither a '-' nor '+')
         ^
Step 3: "42" ("42" is read in)
           ^
The parsed integer is 42.
Since 42 is in the range [-231, 231 - 1], the final result is 42.

Example 2:

Input: s = "   -42"
Output: -42
Explanation:
Step 1: "   -42" (leading whitespace is read and ignored)
            ^
Step 2: "   -42" ('-' is read, so the result should be negative)
             ^
Step 3: "   -42" ("42" is read in)
               ^
The parsed integer is -42.
Since -42 is in the range [-231, 231 - 1], the final result is -42.

Example 3:

Input: s = "4193 with words"
Output: 4193
Explanation:
Step 1: "4193 with words" (no characters read because there is no leading whitespace)
         ^
Step 2: "4193 with words" (no characters read because there is neither a '-' nor '+')
         ^
Step 3: "4193 with words" ("4193" is read in; reading stops because the next character is a non-digit)
             ^
The parsed integer is 4193.
Since 4193 is in the range [-231, 231 - 1], the final result is 4193.
 

Constraints:

0 <= s.length <= 200
s consists of English letters (lower-case and upper-case), digits (0-9), ' ', '+', '-', and '.'.
*/



// Time Complexity: O(n)
// Space Complexity: O(1)

/*
Explanation:
The `myAtoi` function iterates through each character of the input string exactly once to convert the string to a
32-bit signed integer. The time complexity is O(n) where n is the length of the string because each character is
processed a single time in one pass, making the overall execution time linear in relation to the input size.

The space complexity is O(1), or constant space complexity, because the amount of memory used does not increase with
the size of the input string. Only a fixed number of variables (sign, number, and begin) are used regardless of the input size.

Function Operation:
1. The function starts by initializing variables to store the sign of the number, the resulting number itself, and a flag to
indicate whether digit processing has begun.
2. It then iterates over each character in the input string:
   - It ignores leading spaces until it encounters the first non-space character.
   - It checks for '+' or '-' to set the sign of the number.
   - Once it starts processing digits, it continues until it encounters a non-digit or completes the string.
   - For each digit, it checks for potential overflow before adding the digit to the current number.
3. The function multiplies the final number by its sign and returns the result, ensuring it handles both positive and negative
numbers and respects the 32-bit integer boundaries.
*/

