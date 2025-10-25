/**
 * Problem Name: 230.Kth Smallest Element in a BST
 * Time: O(n), Space: O(h) >> Stack
 * 
 */
public class KthSmallest
{
    private int count = 0;
    private int result = 0;

    public int kthSmallest(TreeNode root,int k)
    {
        inOrderTraversal(root, k);
        return result;
    }
    private void inOrderTraversal(TreeNode node, int k)
    {
        if(node == null)
            return;

        inOrderTraversal(node.left, k);

        count++;
        if(count == k)
        {
            result = node.val;
            return;
        }

        inOrderTraversal(node.right, k);
    }
}
