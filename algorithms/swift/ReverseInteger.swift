// Title : Reverse Integer
// Source : https://leetcode.com/problems/reverse-integer/
// Author: Pierre Joly
// Date: 2024-04-22 (YYYY-MM-DD)
// ID: 7
// Difficulty: Medium

/*
# Description :

Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

Example 1:
Input: x = 123
Output: 321

Example 2:
Input: x = -123
Output: -321

Example 3:
Input: x = 120
Output: 21

Constraints:

-231 <= x <= 231 - 1
*/

class Solution {
    func reverse(_ x: Int) -> Int {
        let sign: Int = (x > 0) ? 1 : -1
        var X: Int = abs(x)

        let max_div_10: Int32 =  Int32.max / 10
        let max_mod_10: Int32 = Int32.max % 10

        var reversed_x: Int = 0;

        while ( X != 0) {
            var pop: Int = X % 10
            X = X / 10

            if (reversed_x > max_div_10 || (reversed_x == max_div_10 && pop > max_mod_10)) {
                return 0;
            } 

            reversed_x *= 10
            reversed_x += pop
        }
        return reversed_x * sign
    }
}

// Time Complexity**: O(n), where n is the number of digits in the integer. Each digit is processed exactly once.
// Space Complexity**: O(1), as the solution uses a constant amount of space regardless of the input size.

/*
Explanation:

It starts by determining the sign of the input to handle positive and negative numbers uniformly.
The integer is then processed in its absolute form, extracting digits from the end and building the reversed integer incrementally. Each digit is obtained using the modulus operation (`x % 10`) and
the integer is then truncated by dividing by 10 (x // 10). These digits are reassembled into the new integer
(reversed_x) by multiplying reversed_x by 10 (to shift its digits) and adding the extracted digit. Crucially,
before adding the digit, a check is performed to ensure that appending this digit will not cause reversed_x to
exceed the 32-bit integer limits. This check is vital to prevent overflow which would invalidate the reversal.
*/