public class ReverseString
{
    public String reverseStr(String s, int k)
    {
        int n = s.length();
        char[] arr = s.toCharArray();
        for(int l = 0; l < n; l += 2 * k)
        {
            int r = Math.min(l + k - 1, n - 1);
            reverse(arr, l, r);
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
}