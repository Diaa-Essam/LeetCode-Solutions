class MostWordsFound {
  int mostWordsFound(List<String> sentences) {
    int result = 0;
    for (String str in sentences) {
      int currentCount = 0;
      for (int i = 0; i < str.length; i++) {
        if (str[i] == ' ') {
          currentCount++;
        }
      }
      result = max(result, currentCount + 1);
    }
    return result;
  }
}
