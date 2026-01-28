public class
{
    public int evalRPN(String[] tokens) 
    {
        Stack<Integer> stack = new Stack<>();
        for(int i = 0; i < tokens.length; i++)
        {
            if(isOperator(tokens[i]))
            {
                int x2 = stack.pop();
                int x1 = stack.pop();

                int result = performOperation(x1, x2, tokens[i]);
                stack.push(result);
            }
            else
            {
                stack.push(Integer.parseInt(tokens[i]));
            }
        }
        return stack.peek();
    }
    private boolean isOperator(String s)
    {
        return s.equals("/") || s.equals("*") || s.equals("+") || s.equals("-"); 
    }
    private int performOperation(int x1, int x2, String s)
    {
        if(s.equals("/"))
            return x1 / x2;
        else if(s.equals("*"))
            return x1 * x2;
        else if(s.equals("+"))
            return x1 + x2;
        else
            return x1 - x2;
    }
}