//2553. Separate the Digits in an Array
List<int> separateDigits(List<int> nums) {
  List<int> result = [];
  for (int i = 0; i < nums.length; i++) {
    int num = nums[i];
    List<int> temp = [];
    while (num != 0) {
      temp.add(num % 10);
      num = num ~/ 10;
    }
    for (int j = temp.length - 1; j >= 0; j--) {
      result.add(temp[j]);
    }
  }
  return result;
}

// 1512.Number Of Good Pairs
int numIdenticalPairs(List<int> nums) {
  int result = 0;
  for (int i = 0; i < nums.length; i++) {
    for (int j = i + 1; j < nums.length; j++) {
      if (nums[i] == nums[j]) {
        result++;
      }
    }
  }
  return result;
}

//3507. Minimum Pair Removal to Sort Array I
int minimumPairRemoval(List<int> nums) {
  int operations = 0;

  while (!isNonDecreasing(nums)) {
    int minSum = 99999999;
    int minIndex = 0;

    for (int i = 0; i < nums.length - 1; i++) {
      int sum = nums[i] + nums[i + 1];
      if (sum < minSum) {
        minSum = sum;
        minIndex = i;
      }
    }

    nums[minIndex] += nums[minIndex + 1];
    nums.removeAt(minIndex + 1);
    operations++;
  }
  return operations;
}

bool isNonDecreasing(List<int> nums) {
  for (int i = 0; i < nums.length - 1; i++) {
    if (nums[i] > nums[i + 1]) {
      return false;
    }
  }

  return true;
}
