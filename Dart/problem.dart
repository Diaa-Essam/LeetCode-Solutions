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

// 3637.Trionic Array I
bool isTrionic(List<int> nums) {
  for (int i = 0; i < nums.length; i++) {
    for (int j = i; j < nums.length; j++) {
      if (isIncreasing(nums.sublist(0, i + 1)) &&
          isNonIncreasing(nums.sublist(i, j + 1)) &&
          isIncreasing(nums.sublist(j, nums.length)))
        return true;
    }
  }
  return false;
}

bool isIncreasing(List<int> nums) {
  if (nums.length < 2)
    return false; // Need at least 2 elements for strictly increasing
  for (int i = 0; i < nums.length - 1; i++) {
    if (nums[i] >= nums[i + 1]) {
      return false;
    }
  }
  return true;
}

bool isNonIncreasing(List<int> nums) {
  if (nums.length < 2)
    return false; // Need at least 2 elements for strictly increasing
  for (int i = 0; i < nums.length - 1; i++) {
    if (nums[i] <= nums[i + 1]) {
      return false;
    }
  }
  return true;
}

// 3379.Transformed Array

List<int> constructTransformedArray(List<int> nums) {
  List<int> result = [];
  int n = nums.length;

  for (int i = 0; i < n; i++) {
    int step = nums[i];
    int newIndex = i;
    newIndex = ((step + i) % n + n) % n;

    result.add(nums[newIndex]);
  }

  return result;
}

// 190. Reverse Bits
int reverseBits(int n) {
  String binaryData = n.toRadixString(2).padLeft(32, '0');

  String reversed = binaryData.split('').reversed.join('');

  return int.parse(reversed, radix: 2);
}

/*
  191.Number Of 1 Bits

  Approach: Is checking the last bit if it's one we increament the counter else nothing and after that we 
  shift right to get rid off this bit.
  Loop until n > 0.

  Time: O(32) --> O(1)
  Space: O(1) 
 */
int hammingWeight(int n) {
  int count = 0;

  while (n > 0) {
    count += n & 1;
    n = n >> 1;
  }
  return count;
}

/*
  2540. Minimum Common Value

  Approach: Using two pointers 'i' for the first list and 'j' for the second one.
  if the two pointer point to the same value, just retun it, but if the value 
  under the 'i' is greater than  the value under the 'j' we should move j right 
  and so on until the loop ends if we didn't find a value to return we return -1.

  Time: O(m + n), where m = nums1.length, n = nums2.length
  Space: O(1)
 */
int getCommon(List<int> nums1, List<int> nums2) {
  int i = 0, j = 0;
  while (i < nums1.length && j < nums2.length) {
    if (nums1[i] == nums2[j]) {
      return nums1[i];
    } else if (nums1[i] < nums2[j]) {
      i++;
    } else {
      j++;
    }
  }
  return -1;
}
