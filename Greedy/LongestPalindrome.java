public class LongestPalindrome
{
    public int longestPalindrome(String s)
    {
        HashMap<Character, Integer> map = new HashMap<>();
        
        for(int i = 0; i < s.length(); i++)
        {
            char ch = s.charAt(i);
            if(map.containsKey(ch))
            {
                map.put(ch, map.get(ch) + 1);
            }
            else
            {
                map.put(ch, 1);
            }
        }
        int result = 0;
        boolean isThereOddFrequencies = false;
        for(int val : map.values())
        {
            if(val % 2 == 0)
            {
                result += val;
            }
            else
            {
                result += (val - 1);
                isThereOddFrequencies = true;
            }
        }
        return isThereOddFrequencies? result + 1 : result;  
    }

}