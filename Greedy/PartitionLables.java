/**
 * Time: O(n), Space: O(1)
 * 
 * Applications:
 * 1-Memory Management: Allocate segements with dependencies.
 * 2-Task Scheduling: Group tasks with shared resources.
 * 3-Compression: Group repeated patterns together.
 */

public class PartitionLables
{
    public List<Integer> partitionLabels(String s)
    {
        HashMap<Character, Integer> map = new HashMap<>();
        for(int i = 0; i < s.length(); i++)
        {
            char  ch = s.charAt(i);
            map.put(ch, i);
        }
        int start = 0, end  = 0;
        List<Integer> result = new ArrayList<>();

        for(int i = 0; i < s.length(); i++)
        {
            char ch = s.charAt(i);
            end = Math.max(end, map.get(ch));

            if(i == end)
            {
                result.add(end - start + 1);
                start = i + 1;
            }
        }
        return result;
    }
}
