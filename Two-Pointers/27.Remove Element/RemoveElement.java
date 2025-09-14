/*
 * Approach: Two pointers
 * - tracks the next position to place a non-"val" element
 * - Pointer 'j' scans the array.
 * - After processing return the number of elements not equal to "val".
 * Time: O(n), Space: O(1)
 */
public class RevmoveElement
{
    public int removeElement(int[] nums, int val) 
    {
        int i = 0;
        for(int j = 0; j < nums.length; j++)
        {
            if(nums[j] != val){
                nums[i++] = nums[j];
            }
        }
        return i;
    }
}