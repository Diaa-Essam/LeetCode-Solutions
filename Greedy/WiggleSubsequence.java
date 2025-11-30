/**
 * Time: O(n), Space: O(1)
 * Idea: When ever you see a change (a wiggle) in  the direction increment the count of the subsequence.
 * 
 * Foucs on: 
 *  - prevDiff = currDiff; 
 */

public class WiggleSubsequence
{
    public int wiggleMaxLength(int[] nums)
    {
        int count = 0, prevDiff = 0;
        for (int i = 1; i < nums.length; i++)
        {
            int currDiff = nums[i] - nums[i - 1];
            if(currDiff > 0 && prevDiff <= 0 || currDiff < 0 && prevDiff >= 0)
            {
                count++;
                prevDiff = currDiff;
            }    
        }
        return count + 1;
    }

}