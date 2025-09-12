    /*
     *   ========================    Thoughts    ========================
     * Framework for solving the problem:
     *    1-Define the objective fucnction
     *       -F(i) = Longest Increasing Subsequence of the give array up to index i.
     *    2-Identify the base cases
     *       -Arrays.fill(nums, 1) >> since LIS of each element is at least 1.
     *   3-Recurrence Relation
     *       F(i) = Math.max(F(i), 1 + F(j));
     *   4- Order of computation
     *       -Buttom-Up
     *   5- Location of the answer
     *       F(n - 1), where n is the length of nums array.
     *   ========================    complexities    ========================
     *   Time Complexity: O(n)
     *   Space Complexity: O(n^2)
     * */

    import java.util.Arrays;

    class LongestIncreasingSubsequence {
        public int lengthOfLIS(int[] nums)
        {
            int n = nums.length;
            int[] dp = new int[n];
            Arrays.fill(dp, 1);

            for(int i = 1; i < n; i++)
            {
                for(int j = 0;j < i;j++)
                {
                    if(nums[i] > nums[j]){
                        dp[i] = Math.max(dp[i], dp[j] + 1);
                    }
                }
            }
            return findMax(dp);
        }
        private int findMax(int[] nums){
            int max = nums[0];
            for(int i = 1; i < nums.length; i++){
                if(nums[i] > max)
                    max = nums[i];
            }
            return max;
        }
    }