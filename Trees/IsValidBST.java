/**
 * Time: O(n)
 * Space: O(h)
 * 
 * 
 * Applications: 
 *  Database Indexing
 *  File Systems
 *  Compiler Design
 *  Network Routing
 *  Data Integrity
 */

public class IsValidBST
{
    private Integer prev = null;

    public boolean isValidBST(TreeNode root) {
        if (root == null) return true;

        // Check left subtree
        if (!isValidBST(root.left)) return false;

        // Check current node
        if (prev != null && root.val <= prev) return false;
        prev = root.val;

        // Check right subtree
        return isValidBST(root.right);
    }

    // Time O(n^2)
//    ArrayList<Integer> list = new ArrayList<>();
//    public boolean isValidBST(TreeNode root)
//    {
//        if(root == null) return true;
//
//        isValidBST(root.left);
//        list.add(root.val);
//        isValidBST(root.right);
//
//        return isValidArray(list);
//    }
//    private boolean isValidArray(ArrayList<Integer> list){
//        for (int i = 0; i < list.size(); i++)
//        {
//            for (int j = i + 1; j < list.size(); j++)
//            {
//                if(list.get(i) > list.get(j)) return false;
//            }
//        }
//        return true;
//    }
}
