public class LCIS
{
    public int findLengthOfLCIS(int[] nums) 
    {
        int max = 1;
        int count = 1;
        for (int i = 1; i < nums.length; i++)
        {
            if(nums[i] > nums[i - 1])
            {
                count++;
                max = Math.max(count, max);
            }
            else
            {
                count = 1;
            }
        }
        return max;
    }
}
/**
 * Time Complexity: O(n)
 * Space Complexity: O(1)
 * 
 * Applications: 
 * Stock Markets: Finding longest rising price streaks.
 */