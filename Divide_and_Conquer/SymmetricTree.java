public class SymmetricTree
{
    public boolean isSymmetric(TreeNode root) 
    {
        if(root == null) return true;
        
        return isSymmetricRecur(root.left, root.right);  
    }
    private boolean isSymmetricRecur(TreeNode p, TreeNode q){
        if(p == null && q == null) return true;
        if(p == null || q == null) return false;
        if(p.val != q.val) return false;

        return isSymmetricRecur(p.right, q.left) && isSymmetricRecur(p.left, q.right);
    }
}
/*
 * Time: O(n) >> Solving this recurrence (T(n) = 2T(n/2) + 1)
 * Space: O(h) >> h can be (n) or (log n) depends on if the tree is skewed or almost balanced.
 * 
 * Applications: 
 * Computer Vision: Object symmetry detection in image processing.
 * Network Topology: Checking balanced network architectures.
 */