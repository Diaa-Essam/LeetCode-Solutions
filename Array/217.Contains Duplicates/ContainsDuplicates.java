public class ContainsDuplicates
{
    public boolean containsDuplicate(int[] nums)
    {
        HashSet<Integer> set = new HashSet<>();
        
        for (int i = 0; i < nums.length; i++)
        {
            boolean flag = set.add(nums[i]);
            if(!flag) return true;
        }
        return false;
    }
}