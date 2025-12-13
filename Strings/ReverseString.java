/**
 * Time:O(n), Space: O(1)
 * Approach: 
 * I used two pointers one at the beginning and the other at the end.
 * Using the sawp logic we learned before.
 * Don't forget to update you pointers and you have to keep going until left and right equal to each other.(Doesn't matter if we swap an element with itself)
 */
public class ReverseString
{
    public void reverseString(char[] s) 
    {
        int left = 0, right = s.length - 1;

        while(left < right)
        {
            char temp = s[left];
            s[left] = s[right];
            s[right] = temp;

            left++;
            right--;
        }
    }
}