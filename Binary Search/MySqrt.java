/**
 * Approach: Binary Search
 * Search space: 1 to x (square root lies in this range for x > 0)
 * 
 * How it works:
 * - If mid <= x / mid, then mid could be the answer or we might find bigger valid number
 * - So we store mid as result and search right half
 * - If mid > x / mid, then mid is too big, search left half
 * 
 * Why use mid <= x / mid?
 * - Prevents integer overflow that would happen with mid * mid
 * 
 * Example: x = 8
 * mid=4 -> 4 > 8/4=2 -> too big, go left
 * mid=2 -> 2 <= 8/2=4 -> valid, store 2, go right  
 * mid=3 -> 3 > 8/3=2 -> too big, go left
 * Loop ends, return stored result=2
 * 
 * Time: O(log n), Space: O(1)
 */

public class MySqrt
{
    public int mySqrt(int x) 
    {
        if(x == 0) return x;
        int left = 1, right = x, result = x;
        while(left <= right)
        {
            int mid = left + (right - left) / 2;
            
            if(mid <= x / mid)
            {
                result = mid;
                left = mid + 1;
            }
            else 
            {
                right = mid - 1;
            }
        }    
        return result;
    }
}