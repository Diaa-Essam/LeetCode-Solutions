public class FindAnagrams
{
    /*
 * 438. Find All Anagrams in a String
 *
 * Approach: Sliding Window with Frequency Map
 *
 * 1. Build a frequency map of characters in string 'p'
 * 2. Use a sliding window of size p.length() over string 's'
 * 3. Maintain a frequency map for the current window
 * 4. Compare window map with target map in O(1) using match count

 * Time Complexity: O(n * k)
 >>>> Note: This solution Gives TLE :(
 */
    public List<Integer> findAnagrams(String s, String p)
    {
        List<Integer> result = new ArrayList<>();
        HashMap<Character, Integer> map = new HashMap<>();
        for(int i = 0; i < p.length(); i++)
        {
            if(map.containsKey(p.charAt(i))){
                map.put(p.charAt(i), map.get(p.charAt(i)) + 1);
            }
            else
            {
                map.put(p.charAt(i), 1);
            }
        }
        for(int i = 0; i <= s.length() - p.length(); i++)
        {
            if(getHashMap(s, i, i + p.length()).equals(map))
            {
                result.add(i);
            }
        }
        return result;
    }
    private HashMap<Character, Integer> getHashMap(String p, int start ,int end)
    {
        HashMap<Character, Integer> map = new HashMap<>();
        for(int i = start; i < end; i++)
        {
            if(map.containsKey(p.charAt(i)))
            {
                map.put(p.charAt(i), map.get(p.charAt(i)) + 1);
            }
            else
            {
                map.put(p.charAt(i), 1);
            }
        }
        return map;
    }
}