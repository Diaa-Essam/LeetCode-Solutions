public class MinimumDepthOfBinaryTree
{
    public int minDepth(TreeNode root) 
    {
        if(root == null) return 0;

        if(root.left == null) return 1 + minDepth(root.right);
        else if(root.right == null) return 1 + minDepth(root.left);
        return Math.min(minDepth(root.right), minDepth(root.left)) + 1;
    }
}