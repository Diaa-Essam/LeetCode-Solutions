   /*
    *   ========================    Thoughts    ========================
    * Framework for solving the problem:
    *    1-Define the objective fucnction
    *       -F(i) = Maximum amount of money you can rob from i hourses
    *    2-Identify the base cases
    *       -F(0) = nnums[0]
    *       -F(1) = Math.max(nums[0], nums[1])
    *   3-Recurrence Relation
    *       F(i) = Math.max(nums[i] + F[i - 2], F[i - 1])
    *       >> Robing the current house with the accumulative sum of two houses before or the accumulative sum of the house before that directly.
    *   4- Order of computation
    *       -Buttom-Up
    *   5- Location of the answer
    *       F(n - 1), where n is number of houses
    *   ========================    complexities    ========================
    *   Time Complexity: O(n)
    *   Space Complexity: O(n)
    * */

public class HouseRobber
{
    public int rob(int[] nums)
    {
        int n = nums.length;
        int[] dp = new int[n];
        if(n == 1) return nums[0];
        dp[0] = nums[0];
        dp[1] = Math.max(nums[0], nums[1]);

        for(int i = 2; i < n; i++){
            dp[i] = Math.max(nums[i] + dp[i - 2], dp[i - 1]);
        }
        return dp[n - 1];
    }
}