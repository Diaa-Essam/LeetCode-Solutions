// # Intuition
// If we found duplicate letter but with different case delete those duplicates.
// Example: input "aeEc" --> e and E is the same letter but different case so the output should be "ac".

// # Approach
// We will use a stack and push the current element if the stack is empty or "peek is NOT the same letter with different case", otherwise we should pop from the stack meaning that they are the same letter but different cases.
// # Complexity
// - Time complexity: O(n)

// - Space complexity: O(n): for the use of the stack.

class Solution {
    public String makeGood(String s) 
    {
        Stack<Character> stack = new Stack<>();
        StringBuilder result = new StringBuilder();
        for(int i = 0; i < s.length(); i++)
        {
            if(stack.isEmpty() || Math.abs(stack.peek() - s.charAt(i)) != 32)
            {
                stack.push(s.charAt(i));
            }
            else
            {
                stack.pop();
            }
        }   
        while(!stack.isEmpty())
        {
            result.append(stack.pop());
        } 
        return result.reverse().toString();    
    }
}
```