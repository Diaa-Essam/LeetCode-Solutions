public class IsSubsequence
{
    public boolean isSubsequence(String s, String t) 
    {
        // return s.length() == lcs(s,t);
        if(s.length() == 0)
            return true;
        int i = 0, j = 0;
        
        while(i < s.length() && j < t.length())
        {
            if(s.charAt(i) == t.charAt(j))
            {
                i++;
                j++;
            }
            else
            {
                j++;
            }
        }
        return i == s.length();
    }
}