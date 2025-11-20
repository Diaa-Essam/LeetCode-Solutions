/**
 * Note that you must sell before buying again.
 * The idea here is when ever you see a potential profit you sell your stock.
 * 
 * Time: O(n), Space: O(n)
 */
public class BestTimeToSell
{
    public int maxProfit(int[] prices) 
    {
        int maxProfit = 0;
        for(int i = 1; i < prices.length; i++)
        {
            if(prices[i] > prices[i - 1])
            {
                maxProfit += prices[i] - prices[i - 1]; 
            }
        }
        return maxProfit;
    }
}