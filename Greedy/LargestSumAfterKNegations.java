public class LargestSumAfterKNegations
{
    public int largestSumAfterKNegations(int[] nums, int k) {
    Arrays.sort(nums);
    int i = 0;
    
    while (i < nums.length && k > 0 && nums[i] < 0) {
        if (nums[i] < 0) {
            nums[i] = -nums[i];
            i++;
            k--;
        }
    }
    if(k % 2 == 1)
    {
        int minIndex = getMinIndex(nums);
        nums[minIndex] = -nums[minIndex]; 
    }
    
    return getSum(nums);
}
    private int getMinIndex(int[] nums)
    {
        int minIndex = 0;
        for(int i = 1; i < nums.length; i++)
        {
            if(nums[i] < nums[minIndex])
                minIndex = i;
        }
        return minIndex;
    }
    private int getSum(int[] nums)
    {
        int result = 0; 
        for (int num : nums)
        {
            result += num;
        }
        return result;
    }
}