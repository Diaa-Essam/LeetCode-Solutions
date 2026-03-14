class ShortestPathBinaryMatrix
{
    public int shortestPathBinaryMatrix(int[][] grid) {
        int n = grid.length;
        if (grid[0][0] == 1 || grid[n-1][n-1] == 1) return -1;
        if (n == 1) return 1;  // Edge case: 1x1 grid
        
        Queue<int[]> queue = new LinkedList<>();
        queue.offer(new int[]{0, 0});
        grid[0][0] = 1;  // Mark as visited
        
        int distance = 1;
        int[][] directions = {
            {-1,0}, {1,0}, {0,-1}, {0,1},
            {-1,-1}, {-1,1}, {1,-1}, {1,1}
        };
        
        while (!queue.isEmpty()) 
        {
            int size = queue.size();
            
            for (int i = 0; i < size; i++) {
                int[] cell = queue.poll();
                int r = cell[0];
                int c = cell[1];
                
                if (r == n-1 && c == n-1) return distance;
                
                for (int[] dir : directions) 
                {
                    int nr = r + dir[0];
                    int nc = c + dir[1];
                    
                    if (isValid(nr, nc, n, n) && grid[nr][nc] == 0) {
                        grid[nr][nc] = 1;
                        queue.offer(new int[]{nr, nc});
                    }
                }
            }
            distance++;
        }
        return -1;
    }
    
    private boolean isValid(int r, int c, int rows, int cols) {
        return r >= 0 && r < rows && c >= 0 && c < cols;
    }
}