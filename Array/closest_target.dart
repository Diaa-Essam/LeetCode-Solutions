class ClosestTarget {
  int closestTarget(List<String> words, String target, int startIndex) {
    int length = words.length;
    int minDistance = length;

    for (int steps = 0; steps < length; steps++) {
      int index = (startIndex + steps) % length;
      if (words[index] == target) {
        minDistance = min(steps, minDistance);
        break;
      }
    }
    for (int steps = 0; steps < length; steps++) {
      int index = (startIndex - steps) % length;
      if (words[index] == target) {
        minDistance = min(steps, minDistance);
        break;
      }
    }
    return minDistance == length ? -1 : minDistance;
  }
}
