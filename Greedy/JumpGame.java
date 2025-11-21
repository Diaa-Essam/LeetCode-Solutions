public class JumpGame
{
    public boolean canJump(int[] nums) 
    {
        int maxReach = 0;
        
        for (int i = 0; i < nums.length; i++) {
            // If we can't reach current position, return false
            if (i > maxReach) return false;
            
            // Update the farthest we can reach
            maxReach = Math.max(maxReach, i + nums[i]);
            
            // If we can reach the end, return true
            if (maxReach >= nums.length - 1) return true;
        }
        return true;
    }
}