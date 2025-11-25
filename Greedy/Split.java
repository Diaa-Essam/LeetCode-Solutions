/**
 * Greedy Choice: Split whenever you can.
 * Time Complexity: O(n)
 */
public class Split
{
    public int balancedStringSplit(String s) 
    {
        int balance = 0, count = 0;
        for(int i = 0; i < s.length(); i++)
        {
            if(s.charAt(i) == 'R')
                balance++;
            else
                balance--;

            if(balance == 0)
                count++;
        }    
        return count;
    }
}