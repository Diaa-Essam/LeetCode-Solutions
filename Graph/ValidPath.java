class Solution
{
    public boolean validPath(int n, int[][] edges, int source, int destination)
    {
        if(source == destination) return true;
        Map<Integer, List<Integer>> graph = new HashMap<>();
        // For each edge [u, v]
        for (int[] edge : edges)
        {
            int u = edge[0];
            int v = edge[1];

            // Add v to u's neighbor list
            graph.putIfAbsent(u, new ArrayList<>());
            graph.get(u).add(v);

            // Add u to v's neighbor list (bidirectional)
            graph.putIfAbsent(v, new ArrayList<>());
            graph.get(v).add(u);
        }
        Queue<Integer> queue = new LinkedList<>();
        Set<Integer> visited = new HashSet<>();
        queue.offer(source);
        visited.add(source);

        while(!queue.isEmpty())
        {
            int current = queue.poll();
            if(current == destination)
            {
                return true;
            }
 
            for(int node : graph.get(current))
            {
                if(!visited.contains(node))
                {
                    visited.add(node);
                    queue.offer(node);    
                }
            }
            
        }
        return false;
    }
}