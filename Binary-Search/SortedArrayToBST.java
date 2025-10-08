/*
Time : O(n) 
Space: O(log n) => For Recursion Stack

Applications: 
    -Database Indexing
    -File Sytems
    -Auto-complete/Search
    -Game Development
    -Network Routing
*/
public class SortedArrayToBST
{
    public TreeNode sortedArrayToBST(int[] nums) 
    {
        return buildBST(nums, 0, nums.length - 1);
    }

    public TreeNode buildBST(int[] nums, int left, int right)
    {
        if (left > right) return null;
    
        int mid = left + (right - left) / 2;
        TreeNode root = new TreeNode(nums[mid]);
        
        root.left = buildBST(nums, left, mid - 1);
        root.right = buildBST(nums, mid + 1, right);
        
        return root;
    }
}
