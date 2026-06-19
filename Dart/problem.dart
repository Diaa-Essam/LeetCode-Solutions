//2553. Separate the Digits in an Array

import 'dart:math';

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
  2540.Minimum Common Value

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

/*
  693. Binary Number with Alternating Bits
  Appraoch: Getting the bit representaion for the given number 'n' as a string, 
  and check if two adjacent bits have the same bit we return false, if all things are right we return ture;

  Time: O(32) --> O(1)
  Space: O(32) -> O(1)

 */

bool hasAlternatingBits(int n) {
  String str = n.toRadixString(2);

  for (int i = 1; i < str.length; i++) {
    if (str[i] == str[i - 1]) {
      return false;
    }
  }
  return true;
}

/*
  762.Prime Number Of Set Bits in Binary Representation


  Thought Process: Looping through the numbers from left to right both included using a counter 'i', 
  get the number of bits for the current value of 'i' and if it's prime we increment the result value by 1.

  leverging the fact that "1 <= left <= right <= 10^6"
  so the binary representation in the worst case will be of 20 bits, now can make a set of the prime numbers from 0 to 20 easily for optimization purposes.
  Set<int> primes = {2, 3, 5, 7, 11, 13, 17, 19};

  Time: O(20 * n) -> O(n), where n is (right  - left)
  Space: O(1)
 */

int countPrimeSetBits(int left, int right) {
  int result = 0;
  Set<int> primes = {2, 3, 5, 7, 11, 13, 17, 19};

  for (int i = left; i <= right; i++) {
    int bits = countSetBits(i);
    if (primes.contains(bits)) {
      result++;
    }
  }
  return result;
}

int countSetBits(int n) {
  int count = 0;
  while (n > 0) {
    count += n & 1;
    n = n >> 1;
  }
  return count;
}

/*
868. Binary Gap

Thought Process: converting the given number into a string of it's binary representation,
looping through these bits whenever you find '1' start another loop to find the position of the next one and store the differece of the positions between those two,
return the maxGap at the end. 

Time: O(n^2), which is negligable. max value of str.length = 32 bits 
Space: O(1)
 */

int binaryGap(int n) {
  int maxGap = 0;

  String str = n.toRadixString(2);
  for (int i = 0; i < str.length; i++) {
    if (str[i] == '1') {
      for (int j = i + 1; j < str.length; j++) {
        if (str[j] != '0') {
          maxGap = max(maxGap, j - i);
          break;
        }
      }
    }
  }

  return maxGap;
}

/*
1752. Check if Array Is Sorted and Rotated

Time: O(n)
Space: O(1)
 */

bool check(List<int> nums) {
  int drops = 0;
  int n = nums.length;

  for (int i = 0; i < n; i++) {
    if (nums[i] > nums[(i + 1) % n]) {
      drops++;
    }
  }

  return drops <= 1;
}

/*
2124.Check if All A's Appears Before All B's

Thought Process: Loop through the given string whenever you find 'b', run other loop to find if there other element after that index with character 'a'

Time: O(n^2), worst case when all elements are b's.
Space: O(1)
 */

bool checkString(String s) {
  for (int i = 0; i < s.length; i++) {
    if (s[i] == 'b') {
      for (int j = i + 1; j < s.length; j++) {
        if (s[j] == 'a') {
          return false;
        }
      }
    }
  }
  return true;
}

int numSpecial(List<List<int>> mat) {
  int result = 0;

  for (int i = 0; i < mat.length; i++) {
    for (int j = 0; j < mat[0].length; j++) {
      if (mat[i][i] == 1 && ckeckPosition(mat, i, j)) {
        result++;
      }
    }
  }
  return result;
}

bool ckeckPosition(List<List<int>> mat, int row, int col) {
  int numberOfOnes = 0;
  for (int j = 0; j < mat[0].length; j++) {
    if (mat[row][j] == 1) {
      numberOfOnes++;
    }
  }

  for (int i = 0; i < mat.length; i++) {
    if (mat[i][col] == 1) {
      numberOfOnes++;
    }
  }
  return numberOfOnes == 2;
}

/*
  2482.Difference Between Ones and Zeros in Row and Column
  
  Time: O(m×n×(m+n)) >> very slow for large data sets
  space: O(m*n)

 */
// Gives TLE, so precomute number of ones of
// each row and put it in an array and precompute
// number of 1 in each column and put it in an array.

List<List<int>> onesMinusZeros2(List<List<int>> grid) {
  int m = grid.length;
  int n = grid[0].length;
  List<List<int>> result = List.generate(m, (_) => List.filled(n, 0));

  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      result[i][j] = numberOfOnes(grid, i, j) - numberOfZeros(grid, i, j);
    }
  }
  return result;
}

int numberOfOnes(List<List<int>> mat, int row, int col) {
  int numberOfOnes = 0;
  for (int j = 0; j < mat[0].length; j++) {
    if (mat[row][j] == 1) {
      numberOfOnes++;
    }
  }

  for (int i = 0; i < mat.length; i++) {
    if (mat[i][col] == 1) {
      numberOfOnes++;
    }
  }
  return numberOfOnes;
}

int numberOfZeros(List<List<int>> mat, int row, int col) {
  int numberOfZeros = 0;
  for (int j = 0; j < mat[0].length; j++) {
    if (mat[row][j] == 0) {
      numberOfZeros++;
    }
  }

  for (int i = 0; i < mat.length; i++) {
    if (mat[i][col] == 0) {
      numberOfZeros++;
    }
  }
  return numberOfZeros;
}

// Optimized Version
/*
Thought Process: instead of computing number of ones and zeros for each row and col every signle iteration,
we will precompute them and put them in two sepearte arrays.

Time: O(m * n)
Space: O(m * n)
 */
List<List<int>> onesMinusZeros(List<List<int>> grid) {
  int m = grid.length;
  int n = grid[0].length;

  List<int> onesRow = List.filled(m, 0);
  List<int> onesCol = List.filled(n, 0);

  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      onesRow[i] += grid[i][j];
    }
  }

  for (int j = 0; j < n; j++) {
    for (int i = 0; i < m; i++) {
      onesCol[j] += grid[i][j];
    }
  }

  List<List<int>> result = List.generate(m, (_) => List.filled(n, 0));
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      int zerosRow = n - onesRow[i];
      int zerosCol = m - onesCol[j];
      result[i][j] = (onesRow[i] + onesCol[j]) - (zerosRow + zerosCol);
    }
  }
  return result;
}

/*
3120.Count the Number of Special Characters I

Thought Process: Mark lowercase and uppercase occurrences in two boolean arrays.
Count indices where both are true.

Time: O(n)
Space: O(56) -->  O(1), 

 */
int numberOfSpecialChars(String word) {
  int result = 0;
  List<bool> lower = List.filled(26, false);
  List<bool> upper = List.filled(26, false);

  for (int i = 0; i < word.length; i++) {
    int code = word[i].codeUnitAt(0);
    if (code >= 97) {
      lower[code - 97] = true;
    } else {
      upper[code - 65] = true;
    }
  }

  for (int i = 0; i < 26; i++) {
    if (lower[i] && upper[i]) {
      result++;
    }
  }
  return result;
}

/*
2309. Greatest English Letter in Upper and Lower Case

Thought Process: Using almost the same technique of previous problem (3120)
but returning the first element from the end of the two arrays that statisfy our condition.

Time: O(n)
Space: O(1)
 */
String greatestLetter(String s) {
  List<bool> lower = List.filled(26, false);
  List<bool> upper = List.filled(26, false);

  for (int i = 0; i < s.length; i++) {
    int code = s[i].codeUnitAt(0);
    if (code >= 97) {
      lower[code - 97] = true;
    } else {
      upper[code - 65] = true;
    }
  }

  for (int i = 25; i >= 0; i--) {
    if (lower[i] && upper[i]) {
      return String.fromCharCode(i + 65);
    }
  }

  return "";
}

/*
3300.Minimum Element After Replacement With Digit Sum
Thought Process: Looping through the given array, and for each elemnt get the sum of it's digits and put it in a temp array,
once the array is done return the minimum element, there is a follow up for this I can optitmize it by getting the minimum value on the fly without using a temp array.

Time: O(N)
Space: O(N) -->> for the new temp array. 
 */

int minElement(List<int> nums) {
  List<int> temp = List.filled(nums.length, 0);
  for (int i = 0; i < nums.length; i++) {
    int current = nums[i], currentSum = 0;

    while (current > 0) {
      currentSum += current % 10;
      current = current ~/ 10;
    }
    temp[i] = currentSum;
    currentSum = 0;
  }

  return getMin(temp);
}

int getMin(List<int> nums) {
  int minVal = nums[0];
  for (int i = 0; i < nums.length; i++) {
    minVal = min(nums[i], minVal);
  }
  return minVal;
}

/*
1945. Sum of Digits of String After Convert

Thought Process: Looping through the string and coverting every character to it's corresponding position and add it the a string, 
then applay the transform operation k times, and the trasform operation is getting the sum of the digits of the current number.

Time: O(n), n = s.length
Space: O(n)
 */
int getLucky(String s, int k) {
  String str = "";
  for (int i = 0; i < s.length; i++) {
    int currentPos = s[i].codeUnitAt(0) - 97 + 1;
    str += currentPos.toString();
  }

  for (int i = 0; i < k; i++) {
    str = getSumOfDigits(str).toString();
  }
  return int.parse(str);
}

int getSumOfDigits(String s) {
  int result = 0;

  for (int i = 0; i < s.length; i++) {
    result += int.parse(s[i]);
  }
  return result;
}

/*
1945. Sum of Digits of String After Convert

Thought Process: Looping through from 1 to num inclusive and for each number 'i' if that number contains digits their sum is even
we increment the counter result by 1.

Time: O(n), where n is the number and from constrianst max of num is 99 so it will be "O(1)"
Space: O(1)
 */
int countEven(int num) {
  int result = 0;
  for (int i = 1; i <= num; i++) {
    if (getSumOfDigit(i) % 2 == 0) {
      result++;
    }
  }
  return result;
}

int getSumOfDigit(int num) {
  int result = 0;

  while (num > 0) {
    result += num % 10;
    num = num ~/ 10;
  }
  return result;
}

int distributeCandies(List<int> candyType) {
  int result = 0;
  int n = candyType.length;
  Set<int> mySet = Set();
  for (int i = 0; i < n; i++) {
    mySet.add(candyType[i]);
  }
  result = mySet.length;
  return min(n ~/ 2, result);
}

List<int> maxScoreIndices(List<int> nums) {
  List<int> result = [0];
  int score = getNumberOfOnes(nums);
  int maxScore = score;
  for (int i = 0; i < nums.length; i++) {
    if (nums[i] == 0) {
      score++;
    } else {
      score--;
    }

    if (score > maxScore) {
      result = [i + 1];
    } else if (score == maxScore) {
      result.add(i + 1);
    }
  }
  return result;
}

int getNumberOfOnes(List<int> nums) {
  int counter = 0;
  for (int i = 0; i < nums.length; i++) {
    if (nums[i] == 1) {
      counter++;
    }
  }
  return counter;
}

/*
696.Count Binary Substrings

Thought Prcoess; Group consective same characters and record their lengths, 
and then sum of the minimum of two adjacent elements 

Time: O(n)
Space: O(n), Due to the new array 'arr'.
 */
int countBinarySubstrings(String s) {
  List<int> arr = [];
  int counter = 1;

  for (int i = 1; i < s.length; i++) {
    if (s[i] == s[i - 1]) {
      counter++;
    } else {
      arr.add(counter);
      counter = 1;
    }
  }
  arr.add(counter);
  return getMinSumOfAdjacentElements(arr);
}

int getMinSumOfAdjacentElements(List<int> arr) {
  int result = 0;
  for (int i = 1; i < arr.length; i++) {
    result += min(arr[i], arr[i - 1]);
  }
  return result;
}

/*
3751. Total Waviness of Numbers in Range I
 */
int totalWaviness(int num1, int num2) {
  int counter = 0;
  for (int i = num1; i <= num2; i++) {
    counter += getPeakAndVallyes(i);
  }
  return counter;
}

int getPeakAndVallyes(int num) {
  List<int> arr = [];
  while (num > 0) {
    arr.add(num % 10);
    num = num ~/ 10;
  }
  int result = 0;
  for (int i = 1; i < arr.length - 1; i++) {
    if ((arr[i] > arr[i - 1] && arr[i] > arr[i + 1]) ||
        (arr[i] < arr[i - 1] && arr[i] < arr[i + 1])) {
      result++;
    }
  }
  return result;
}

/*
3285. Find Indices of Stable Mountains
 */
List<int> stableMountains(List<int> height, int threshold) {
  List<int> result = [];
  for (int i = 1; i < height.length; i++) {
    if (height[i - 1] > threshold) {
      result.add(i);
    }
  }
  return result;
}

/*
  2215. Find the Difference of Two Arrays
 */
List<List<int>> findDifference(List<int> nums1, List<int> nums2) {
  List<List<int>> result = [];

  List<int> arr1 = [];
  for (int i = 0; i < nums1.length; i++) {
    if (!nums2.contains(nums1[i]) && !arr1.contains(nums1[i])) {
      arr1.add(nums1[i]);
    }
  }
  result.add(arr1);
  List<int> arr2 = [];
  for (int i = 0; i < nums2.length; i++) {
    if (!nums1.contains(nums2[i]) && !arr2.contains(nums2[i])) {
      arr2.add(nums2[i]);
    }
  }
  result.add(arr2);
  return result;
}

List<int> intersection1(List<int> nums1, List<int> nums2) {
  List<int> result = [];
  int n = nums1.length;

  for (int i = 0; i < n; i++) {
    if (nums2.contains(nums1[i]) && !result.contains(nums1[i])) {
      result.add(nums1[i]);
    }
  }
  return result;
}

List<int> intersection(List<List<int>> nums) {
  List<int> result = [];
  int n = nums[0].length;

  for (int i = 0; i < n; i++) {
    bool valid = true;
    for (int j = 1; j < nums.length; j++) {
      if (!nums[j].contains(nums[0][i])) {
        valid = false;
        break;
      }
    }
    if (valid) {
      result.add(nums[0][i]);
    }
  }
  result.sort();
  return result;
}

//1480. Running Sum of 1d Array
List<int> runningSum(List<int> nums) {
  List<int> result = [];
  int runningSum = 0;
  for (int i = 0; i < nums.length; i++) {
    runningSum += nums[i];
    result.add(runningSum);
  }
  return result;
}

// 1413. Minimum Value to Get Positive Step by Step Sum
int minStartValue(List<int> nums) {
  int minSum = 0, currentSum = 0;

  for (int i = 0; i < nums.length; i++) {
    currentSum += nums[i];
    minSum = min(minSum, currentSum);
  }
  return 1 - minSum;
}

// 3838. Weighted Word Mapping
String mapWordWeights(List<String> words, List<int> weights) {
  String result = "";
  for (int i = 0; i < words.length; i++) {
    int weightSum = 0;
    for (int j = 0; j < words[i].length; j++) {
      int letterIndex =
          words[i][j].codeUnitAt(0) -
          97; // The weights are indexed by letter, not by position.
      weightSum += weights[letterIndex];
    }
    int remainder = weightSum % 26;
    weightSum = 0;

    result += String.fromCharCode(122 - remainder);
  }
  return result;
}

// 724. Find Pivot Index
int pivotIndex(List<int> nums) {
  int n = nums.length;

  for (int i = 0; i < n; i++) {
    if (getSum(nums, 0, i) == getSum(nums, i + 1, n)) {
      return i;
    }
  }
  return -1;
}

int getSum(List<int> nums, int left, int right) {
  int sum = 0;
  for (int i = left; i < right; i++) {
    sum += nums[i];
  }
  return sum;
}

// 1732. Find the Highest Altitude
int largestAltitude(List<int> gain) {
  int highestAltitude = 0, sum = 0;
  for (int i = 0; i < gain.length; i++) {
    sum += gain[i];
    highestAltitude = max(highestAltitude, sum);
  }
  return highestAltitude;
}
