
/**
 * Thought Process: 
 *  - Give two input arrays g and s
 *  - g >> Children factor (size of the cookie that can statisfy a child)
 *  - s >> Size of the given cookies
 *  - Now what if we sort the two array and scan through Size of the given cookies and check at each cookie if we can statify a child with that cookie
 *    if yes 
 *       we increment a variable 
 *    else 
 *       no thing to do 
 *    
 *    But in each iteration we have to check if we still in bound of 'g' array.
 * 
 * 
 *  Complexity: 
 *   - Time: O(n log n) >> Yes the sorting here is the bottleneck
 *   - Space: O(1)
 */
public class AssignCookies
{
    public int findContentChildren(int[] g, int[] s)
    {
        // s >> cookies size
        // g >> Children factor
        if(s.length == 0) return 0;

        Arrays.sort(g);
        Arrays.sort(s);
        int childIndex = 0;

        for(int cookie : s)
        {
            if(childIndex < g.length && cookie >= g[childIndex]){
                childIndex++;
            }
        }
        return childIndex;
    }
}