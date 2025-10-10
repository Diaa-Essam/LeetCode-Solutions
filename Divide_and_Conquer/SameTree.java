/**
 * Recurrence Equation: T(n) = 2T(n/2) + 1
 * case 1: T(n) = O(n)
 *  
 * Time : O(n)
 * Space: Worest case:O(log n)
 *        Average case: O(n) 
 */

public class SameTree
{
    public boolean isSameTree(TreeNode p, TreeNode q) 
    {
        if(p == null && q == null) return true; 
        if(p != null && q == null || p == null && q != null) return false;
        if(p.val != q.val) return false;

        return isSameTree(p.left, q.left) && isSameTree(p.right, q.right);  
    }
}