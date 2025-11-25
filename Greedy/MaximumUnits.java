// We sorted by units per box (box[1]) to always take the most valuable boxes first.
public class MaximumUnits
{
    public int maximumUnits(int[][] boxTypes, int truckSize) 
    {
        Arrays.sort(boxTypes, (a, b) -> b[1] - a[1]);
        int i = 0, result = 0;
        while(truckSize > 0 && i < boxTypes.length)
        {
            if(truckSize > boxTypes[i][0])
            {
                result += (boxTypes[i][0] * boxTypes[i][1]); 
                truckSize -= boxTypes[i][0];
            }
            else
            {
                result += (truckSize * boxTypes[i][1]);
                break;
            }
            i++;
        }
        return result;
    }
}