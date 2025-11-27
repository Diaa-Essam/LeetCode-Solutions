public class MaxSubArray
{
    public int maxSubArray(int[] nums) 
    {
        int currentSum = 0, maxSum = nums[0];

        for(int num : nums)
        {
            if(currentSum < 0)
            {
                currentSum = num;
            }
            else
            {
                currentSum += num;
            }

            maxSum = Math.max(currentSum, maxSum);
        }
        return maxSum;
    }
}