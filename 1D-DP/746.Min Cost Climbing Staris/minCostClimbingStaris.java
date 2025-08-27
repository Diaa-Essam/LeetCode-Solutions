public class minCostClimbingStairs
{
    /*
    *   ========================    Thoughts    ========================
    * Framework for solving the problem:
    *    1-Define the objective fucnction
    *       -F(i) = Minimum Cost the reach the ith steps.
    *    2-Identify the base cases
    *       -F(0) = cost[0]
    *       -F(1) = cost[1]
    *   3-Recurrence Relation
    *       F(i) = cost[i] + Math.min(F[i - 1], F[i - 2])
    *   4- Order of computation
    *       -Buttom-Up
    *   5- Location of the answer
    *       Math.min(F[n - 1], F[n - 2]), where n is the length of cost array.
    *   ========================    complexities    ========================
    *   Time Complexity: O(n)
    *   Space Complexity: O(n)
    * */
    public int minCostClimbingStairs(int[] cost)
    {
        int n = cost.length;
        int[] dp = new int[n];

        dp[0] = cost[0];
        dp[1] = cost[1];

        for(int i = 2; i < n; i++){
            dp[i] = cost[i] + Math.min(dp[i - 1], dp[i - 2]);
        }
        return Math.min(dp[n - 1], dp[n - 2]);
    }
}
