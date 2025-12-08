/**
 * Time: O(log n), Space: O(1)
 * 
 * Approach:
 * Binary search has two applications:
 * 1. Searching for a specific target
 * 2. Dividing search space based on a property
 * 
 * Here we use the second approach.
 * Given that array boundaries can be considered as negative infinity,
 * if nums[mid] < nums[mid + 1], the peak must be on the right side
 * (since the sequence is increasing at mid).
 * Otherwise, the peak is at mid or on the left side.
 * (since nums[i] != nums[i + 1] for all vaild i) so may be the peak is at the mid.
 * 
 * We use left < right (not <=) to ensure convergence and avoid infinite loops.
 * At the end, left == right, pointing to a peak element.
 */

public class FindPeakElement {
    public int findPeakElement(int[] nums) {
        if (nums.length == 1) return 0;
        
        int left = 0, right = nums.length - 1;
        while (left < right) {
            int mid = left + (right - left) / 2;
            if (nums[mid] < nums[mid + 1]) {
                left = mid + 1;  // Peak is on the right
            } else {
                right = mid;     // Peak is at mid or left
            }
        }
        return left;
    }
}