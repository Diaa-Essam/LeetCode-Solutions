class MyStack {
    Queue<Integer> q1, q2;
    public MyStack() {
        q1 = new LinkedList<>();
        q2 = new LinkedList<>();
    }
    
    public void push(int x)
    {
        q1.add(x);    
    }
    
    public int pop() 
    {
        while(q1.size() > 1)
        {
            q2.add(q1.remove());
        }
        int last = q1.remove();
        while(!q2.isEmpty())
        {
            q1.add(q2.remove());
        }
        return last;
    }
    
    public int top() 
    {
        while(q1.size() > 1)
        {
            q2.add(q1.remove());
        }
        int last = q1.remove();
        while(!q2.isEmpty())
        {
            q1.add(q2.remove());
        }
        q1.add(last);
        return last;    
    }
    
    public boolean empty() {
        return q1.isEmpty();
    }
}
