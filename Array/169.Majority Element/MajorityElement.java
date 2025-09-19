/*
    -This problem can be solved using to approaches.
        1) Using HashMap to count frequences and return the maximum number has frequences.
           This will cost us >> Space: O(n), Time: O(n).
        2) Using Boyer-Moore Algorithm
           This will cost us >> Space: O(1), Time: O(n).  
 */

// Boyer-Moore Algorithm
public class MajorityElement
{
    public int majorityElement(int[] nums)
    {
        int count = 0, candidate = 0;
        for(int num : nums){
            if(count == 0){
                candidate = num;
            }
            count += (candidate == num)? 1 : -1;
        }
        return candidate;
    }
}