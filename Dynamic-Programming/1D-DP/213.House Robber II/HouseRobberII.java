public class HouseRobberII
{
    public int rob(int[] nums)
    {
        int n = nums.length;
        return Math.max(Math.max(rob(nums, 0, n - 1), rob(nums, 1, n)), nums[0]);
    }
    public int rob(int[] nums, int start, int end)
    {
        int rob1 = 0, rob2 = 0, newRob = 0;

        for(int i = start; i < end; i++){
            newRob = Math.max(rob1 + nums[i], rob2);
            rob1 = rob2;
            rob2 = newRob;
        }
        return newRob;
    }
}