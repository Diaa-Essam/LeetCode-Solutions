/**
 * Problem Name: 103. Binary Tree Zigzag Level Order Traversal
 * Time: O(n), Space: O(n)
 * Applications: Same as 102
 * 
 */

public class ZigzagLevelOrder
{
    public List<List<Integer>> zigzagLevelOrder(TreeNode root)
    {
        List<List<Integer>> result = new ArrayList<>();
        if(root == null) return result;
        Queue<TreeNode> queue = new LinkedList<>();
        queue.offer(root);
        boolean toggle = false;

        while(!queue.isEmpty()){
            int levelSize = queue.size();
            List<Integer> currentLevel = new ArrayList<>();

            for(int i = 0; i < levelSize; i++){
                TreeNode node = queue.poll();
                currentLevel.add(node.val);
                if(node.left != null) queue.offer(node.left);
                if(node.right != null) queue.offer(node.right);
            }
            if(toggle == true)
                currentLevel = currentLevel.reversed();

            result.add(currentLevel);
            toggle = !toggle;
        }
        return result;
    }
}