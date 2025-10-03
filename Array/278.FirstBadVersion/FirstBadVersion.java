/*
Time: O(log(n)), Space: O(1)
Application:(git bisect)
  >> Software development: Finding the first commit that introduced a bug.


*/
public class FirstBadVersion
{
  public int firstBadVersion(int n) 
    {
        int left = 1, right = n;
        while(left < right){
            int mid = left + (right - left) / 2;

            if(isBadVersion(mid)){
                right = mid; // Search left (mid might be first bad)
            }
            else
            {
                left = mid + 1;
            }
        }   
        return left;     
    }
}

