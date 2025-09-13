/*
 * Approach: Two pointers (slow/fast)
 * - Pointer 'i' tracks the last non-zero position.
 * - Pointer 'j' scans the array.
 * - After processing non-zeros, fill remaining indices with zeros.
 * Time: O(n), Space: O(1)
 */
public class MoveZeros
{   // Overwrite + Fill
    public void moveZeroes(int[] nums)
    {
        int i = 0;
        for(int j = 0; j < nums.length; j++)
        {
            if(nums[j] != 0){
                nums[i++] = nums[j];
            }    
        }    
        while(i < nums.length){
            nums[i++] = 0;
        }
    }
}