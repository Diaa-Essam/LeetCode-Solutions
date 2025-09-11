    /*
     *   ========================    Thoughts    ========================
     * Framework for solving the problem:
     *    1-Define the objective fucnction
     *       -F(i) = The value of the Tribonacci sequence at term i.
     *    2-Identify the base cases
     *       -F(0) = 0
     *       -F(1) = 1
     *       -F(2) = 1
     *   3-Recurrence Relation
     *       F(i) = F(i - 1) + F(i - 2) + F(i - 3)
     *   4- Order of computation
     *       -Buttom-Up
     *   5- Location of the answer
     *       F(n)
     *   ========================    complexities    ========================
     *   Time Complexity: O(n)
     *   Space Complexity: O(n)
     * */
public class tribonacci
{
    public int tribonacci(int n)
    {
        if(n == 0) return n;
        if(n <= 2) return 1;
        int[] dp = new int[n + 1];
        dp[0] = 0;
        dp[1] = 1;
        dp[2] = 1;

        for(int i = 3; i <= n; i++){
            dp[i] = dp[i - 1] + dp[i - 2] + dp[i - 3];
        }
        return dp[n];
    }
    /*    ========================    Space Optimized Solution    ========================    */
    public int tribonacci(int n)
    {
        if(n == 0) return n;
        if(n <= 2) return 1;
        int first = 0, second = 1, third = 1;
        for(int i = 3; i <= n; i++){
            int result = first + second + third;
            first = second;
            second = third;
            third = result;
        }
        return third;
    }
}