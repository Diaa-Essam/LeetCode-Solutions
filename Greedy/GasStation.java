public class GasStation
{
    public int canCompleteCircuit(int[] gas, int[] cost) 
    {
        int currentGas = 0, totalGas = 0, index = 0;

        for(int i = 0; i < cost.length; i++)
        {
            int net = (gas[i] - cost[i]);
            totalGas += net;
            currentGas += net;

            if(currentGas < 0)
            {
                index = i + 1;
                currentGas = 0;
            }
        }
        return totalGas >= 0 ? index : -1;
    }
}