class MinimumCost {
  int minimumCost(List<int> cost) {
    cost.sort((a, b) => b.compareTo(a));
    int result = 0;
    int counter = 0;
    for (int i = 0; i < cost.length; i++) {
      if (counter == 2) {
        counter = 0;
        continue;
      }

      result += cost[i];
      counter++;
    }
    return result;
  }
}
