/*
 *   ========================    Thoughts    ========================
 * Framework for solving the problem:
 *    1-Define the objective fucnction
 *       Let dp[i][j] be the length of the longest common subsequence between the first i characters of text1 and the first j characters of text2.
 *    2-Identify the base cases
 *       -F(0, j) = 0 >> When the first string is empty
 *       -F(j, 0) = 0 >> When the second string is empty
 *   3-Recurrence Relation
 *       if characters match
 *          F(i, j) = 1 + F(i - 1, j - 1);
 *       else
 *          F(i, j) = Math.max(F(i - 1, j), F(i, j - 1));
 *   4- Order of computation
 *       -Buttom-Up
 *   5- Location of the answer
 *       F(n, m)
 *   ========================    complexities    ========================
 *   Time Complexity: O(n^2)
 *   Space Complexity: O(n^2)
 *   ========================    Applications    ========================
 *   ~ Git/Diff Tools: Find changes between file versions
 *   ~ DNA Sequence Alignment: Compares genetic sequences in bioinformatics
 *   ~ Plagiarism Detection
 *   ~ Auto-Correction
 * */


public class LongestCommonSubsequence
{
    public int longestCommonSubsequence(String text1, String text2)
    {
        int n = text1.length();
        int m = text2.length();
        int[][] dp = new int[n + 1][m + 1];

        for(int i = 1; i <= n; i++)
        {
            for(int j = 1; j <= m; j++)
            {
                if(text1.charAt(i - 1) == text2.charAt(j - 1))
                    dp[i][j] = 1 + dp[i - 1][j - 1];
                else
                    dp[i][j] = Math.max(dp[i - 1][j], dp[i][j - 1]);
            }
        }
        return dp[n][m];
    }
}