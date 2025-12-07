/**
 * Time: O(log n), Space: O(1)
 * "Applications" 
 * Database: find all records with timestamp between start and end.
 */
public class SearchRange
{
    public int[] searchRange(int[] nums, int target) 
    {
        if(nums.length == 0) return new int[] {-1,-1};
        int[] result = new int[2];
        result[0] = findFirst(nums, target);
        result[1] = findLast(nums, target);
        return result;
    }
    private int findFirst(int[] nums, int target)
    {
        int left = 0, right = nums.length - 1, first = -1;
        while(left <= right)
        {
            int mid = left + (right - left) / 2;
            if(nums[mid] == target)
            {
                first = mid;
                right = mid - 1;
            }
            else if(nums[mid] > target)
            {
                right = mid - 1;
                
            }
            else
            {
                left = mid + 1;
            }
        }
        return first;
    }
    private int findLast(int[] nums, int target)
    {
        int left = 0, right = nums.length - 1, last = -1;
        while(left <= right)
        {
            int mid = left + (right - left) / 2;
            if(nums[mid] == target)
            {
                last = mid;
                left = mid + 1;
            }
            else if(nums[mid] > target)
            {
                right = mid - 1;
            }
            else
            {
                left = mid + 1;
            }
        }
        return last;
    }
}