class ReverseWords 
{
    public String reverseWords(String s) 
    {
        int start = 0 ,end  = 0;
        char[] arr = s.toCharArray();
        while(end < s.length())
        {
            end = findFirstSpaceOrEnd(s,start);
            reverse(arr,start, end - 1);

            start = end + 1;
        }
        return new String(arr);
    }
    private void reverse(char[] arr, int left, int right)
    {
        while(left <= right)
        {
            char temp = arr[left];
            arr[left] = arr[right];
            arr[right] = temp;

            left++;
            right--;
        }
    }
    private int findFirstSpaceOrEnd(String s, int start)
    {
        for (int i = start; i < s.length(); i++)
        {
            if(s.charAt(i) == ' ')
                return i;
        }
        return s.length();
    }
}