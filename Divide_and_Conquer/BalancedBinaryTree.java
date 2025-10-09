public class BalancedBinaryTree
{
    public boolean isBalanced(TreeNode root) 
    {
        if(root == null) return true;
        boolean currentBalanced = Math.abs(height(root.left) - height(root.right)) <= 1;
        boolean leftBalanced = isBalanced(root.left);
        boolean rightBalanced = isBalanced(root.right);
        
    return currentBalanced && leftBalanced && rightBalanced;
    }
    private int height(TreeNode root){
        if(root == null) return 0;

        return Math.max(height(root.left), height(root.right)) + 1;
    }
}