// # Intuition

// "Backspace = pop from stack, regular char = push"

// # Approach

// We will keep two stacks for this task one for 's' and one for 't', whenever we encounter '#' we pop en element and then compare the result of two stacks using 
// "return stack1.equals(stack2);"
// # Complexity
// - Time complexity: O(N + M), where N is the length of s and M is the length of t.


// - Space complexity: O(N + M)

// # Follow-Up Challenge
// Can you solve it in O(1) space.(without stacks)

class Solution {
    public boolean backspaceCompare(String s, String t) 
    {
        Stack<Character> stack1 = new Stack<>();
        Stack<Character> stack2 = new Stack<>();

        for(int i = 0; i < s.length(); i++)
        {
            if(s.charAt(i) == '#' && !stack1.isEmpty())
            {
                stack1.pop();
            }
            else if(s.charAt(i) != '#')
            {
                stack1.push(s.charAt(i));
            }
        }  
        for(int i = 0; i < t.length(); i++)
        {
            if(t.charAt(i) == '#' && !stack2.isEmpty())
            {
                stack2.pop();
            }
            else if(t.charAt(i) != '#')
            {
                stack2.push(t.charAt(i));
            }
        }  
        return stack1.equals(stack2);  
    }
}
```