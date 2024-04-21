// Title : Median of Two Sorted Arrays
// Source : https://leetcode.com/problems/median-of-two-sorted-arrays/
// Author: Pierre Joly
// Date: 2024-04-19 (YYYY-MM-DD)
// ID: 4
// Difficulty: Hard

/*
# Description :

Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.

The overall run time complexity should be O(log (m+n)).

Example 1:

Input: nums1 = [1,3], nums2 = [2]
Output: 2.00000
Explanation: merged array = [1,2,3] and median is 2.
Example 2:

Input: nums1 = [1,2], nums2 = [3,4]
Output: 2.50000
Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
 

Constraints:

nums1.length == m
nums2.length == n
0 <= m <= 1000
0 <= n <= 1000
1 <= m + n <= 2000
-106 <= nums1[i], nums2[i] <= 106
*/
#include <vector>
using namespace std;

class Solution {
public:
    double findMedianSortedArrays(const std::vector<int>& nums1, const std::vector<int>& nums2) {
    const vector<int>& Nums1 = (nums1.size() <= nums2.size()) ? nums1 : nums2;
    const vector<int>& Nums2 = (nums1.size() <= nums2.size()) ? nums2 : nums1;
    
    int x = Nums1.size(), y = Nums2.size();
    bool even = (x+y)%2 == 0;
    int low = 0, high = x;
    int middle = (x + y + 1) / 2;

    while (low <= high) {
        int partitionX = (low + high) / 2;
        int partitionY = middle - partitionX;

        int maxLeftX = (partitionX == 0) ? INT_MIN : Nums1[partitionX - 1];
        int minRightX = (partitionX == x) ? INT_MAX : Nums1[partitionX];
        int maxLeftY = (partitionY == 0) ? INT_MIN : Nums2[partitionY - 1];
        int minRightY = (partitionY == y) ? INT_MAX : Nums2[partitionY];

        if (maxLeftX <= minRightY && maxLeftY <= minRightX) {
            if (even) {
                return (max(maxLeftX, maxLeftY) + min(minRightX, minRightY)) / 2.0;
            } else {
                return max(maxLeftX, maxLeftY);
            }
        } else if (maxLeftX > minRightY) {
            high = partitionX - 1;
        } else {
            low = partitionX + 1;
        }
    }
    throw runtime_error("No valid partition found");
    }
};

// Time complexity: O(log(m+n)) because the binary search method is applied to the smaller of the two arrays, 
//                  minimizing the number of elements inspected during each step of the search.
// Space complexity: O(1) as only a constant amount of extra space is used beyond the input arrays.

/*
Explanation:

This method leverages a binary search technique applied on the smaller of the two input arrays to efficiently find 
the partition that correctly splits the combined elements of both arrays into two halves such that the left half 
contains elements smaller than or equal to the elements in the right half. By adjusting the search range based on 
whether elements on one side of the partition in one array are greater than elements on the opposite side of the 
partition in the other array, it ensures that the search space is reduced logarithmically with each step.

The key to achieving the O(log(m+n)) time complexity lies in the fact that each iteration effectively reduces the 
size of the problem in half, similar to how binary search operates. We check the maximum element on the left side 
and the minimum element on the right side across both partitions to validate the correctness of the partition. If 
the partition is incorrect, adjustments are made by shifting the search boundary. This allows us to efficiently 
arrive at the correct partition.

Once the correct partition is found, if the combined length of the arrays is odd, the median is the maximum element 
on the left side of the partition. If even, it is the average of the maximum element on the left and the minimum 
element on the right, thereby giving us the median of the combined arrays. The space complexity remains O(1) because 
the procedure uses a fixed number of variables, regardless of the input size.
*/

