/**
 * Problem Name: 107.Binary Tree Level Order Traversal II
 * Almost same as 102.Binary Tree Level Order Traversal + reversing the output
 * Time: O(n), Space: O(n)
 */
public List<List<Integer>> levelOrderBottom(TreeNode root) 
    {
        List<List<Integer>> result = new ArrayList<>();  
        if(root == null) return result;
        Queue<TreeNode> queue = new LinkedList<>();
        queue.offer(root);

        while (!queue.isEmpty()) 
        {
            int levelSize = queue.size();
            List<Integer> currentLevel = new ArrayList<>();
            
            for (int i = 0; i < levelSize; i++) 
            {
                TreeNode node = queue.poll();
                currentLevel.add(node.val);
                if (node.left != null) queue.offer(node.left);
                if (node.right != null) queue.offer(node.right);
            }
            result.add(currentLevel);
        }
        return result.reversed();    
    }