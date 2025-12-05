public class SearchMatrix
{
    public boolean searchMatrix(int[][] matrix, int target) 
    {
        int left = 0, right = matrix.length - 1, n = matrix[0].length;
        while(left <= right)
        {
            int mid = left + (right - left) / 2;
            if(target >= matrix[mid][0] && target <= matrix[mid][n - 1])
            {
                return search(matrix[mid], target);
            }
            else if(target < matrix[mid][0])
            {
                right = mid - 1;
            }
            else
            {
                left = mid + 1;
            }
        }    
        return false;
    }
    private boolean search(int[] nums, int target) 
    {
        int left = 0, right = nums.length - 1;
        while(left <= right)
        {
            int mid = left + (right - left) / 2;
            if(nums[mid] == target)
            {
                return true;
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
        return false;
    }
}