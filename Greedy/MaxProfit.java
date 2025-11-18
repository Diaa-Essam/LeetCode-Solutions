public class MaxProfit
{
    public int maxProfit(int[] prices)
    { 
        int maxProfit = 0, minPrice = prices[0];
        for(int i = 1; i < prices.length; i++)
        {
            if(prices[i] < minPrice)
            {
                minPrice = prices[i];
            }    
            
            if(prices[i] - minPrice > maxProfit)
            {
                maxProfit = prices[i] - minPrice;
            }
        }
        return maxProfit;    
    }// O(n)

    // public int maxProfit(int[] prices) 
    // {
    //     int max = 0;
    //     for(int i = 0; i < prices.length; i++)
    //     {
    //         for(int j = i + 1; j < prices.length; j++)
    //         {
    //             if(prices[j] - prices[i]  > max)
    //             {
    //                 max = prices[j] - prices[i];
    //             }
    //         }
    //     }
    //     return max;    
    // }
}