public class RemoveDuplicates
{
    /*
    * Approach: Two-Pointers
    * Index 'i - 2': To trace the last slot to copy the element at j, if they are not equal.
    * Index 'j': To scan the array.
    *
    * Key Idea: If nums[j] != nums[i - 2], then it's not a third duplicates copy it to i and increment i.
    * */
    public int removeDuplicates(int[] nums)
    {
        int i = 2;
        for(int j = 2; j < nums.length; j++)
        {
            if(nums[j] != nums[i - 2])
            {
                nums[i++] = nums[j];
            }
        }
        return i;
    }
}