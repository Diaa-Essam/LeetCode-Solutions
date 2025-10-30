public class IsAnagram
{
    public boolean isAnagram(String s, String t)
    {
        if (s.length() != t.length()) return false;

        HashMap<Character, Integer> map1 = new HashMap<>();
        HashMap<Character, Integer> map2 = new HashMap<>();

        for (int i  = 0; i < s.length(); i++)
        {
            if(!map1.containsKey(s.charAt(i))){
                map1.put(s.charAt(i), 0);
            }
            else
            {
                map1.put(s.charAt(i), map1.get(s.charAt(i)) + 1);
            }
        }

        // For The Second String
        for (int i  = 0; i < s.length(); i++)
        {
            if(!map2.containsKey(s.charAt(i))){
                map2.put(t.charAt(i), 0);
            }
            else
            {
                map2.put(t.charAt(i), map2.get(t.charAt(i)) + 1);
            }
        }

        return map1.equals(map2);
    }
}// Time: O(n), Space: O(n)
/**
 * Applications
 * 1 - Genetics: Finding similar DNA/Protein sequences.
 * 2 - Search Engines: Identifying related queries and content.
 */