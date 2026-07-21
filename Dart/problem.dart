import 'dart:collection';
import 'dart:math';

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

// 1833. Maximum Ice Cream Bars
int maxIceCream(List<int> costs, int coins) {
  int result = 0, index = 0;
  costs.sort();
  while (coins > 0) {
    if (index < costs.length && coins >= costs[index]) {
      result++;
      coins -= costs[index];
    } else {
      break;
    }
    index++;
  }
  return result;
}

//1672. Richest Customer Wealth
int maximumWealth(List<List<int>> accounts) {
  int maxSum = 0, currentSum = 0;
  for (int i = 0; i < accounts.length; i++) {
    currentSum = 0;
    for (int j = 0; j < accounts[i].length; j++) {
      currentSum += accounts[i][j];
      maxSum = max(maxSum, currentSum);
    }
  }
  return maxSum;
}

/*
3737. Count Subarrays With Majority Element I
 */
int countMajoritySubarrays(List<int> nums, int target) {
  int result = 0, count = 0;
  for (int i = 0; i < nums.length; i++) {
    count = 0;
    for (int j = i; j < nums.length; j++) {
      if (nums[j] == target) {
        count++;
      }
      int length = j - i + 1;
      if (count * 2 > length) result++;
    }
  }
  return result;
}

/*
2089. Find Target Indices After Sorting Array

Thought Process: sort the given array first and then loop throgh the sorted one, whenever finding a value equals to the given target in the array
add it's index in the result array.

Time: O(nlogn), due to sorting the array.
Space: O(1)
 */
List<int> targetIndices(List<int> nums, int target) {
  List<int> result = [];

  nums.sort();
  for (int i = 0; i < nums.length; i++) {
    if (nums[i] == target) {
      result.add(i);
    }
  }
  return result;
}

/*
867. Transpose Matrix
 */
List<List<int>> transpose(List<List<int>> matrix) {
  List<List<int>> result = List.generate(
    matrix[0].length,
    (_) => List.filled(matrix.length, 0),
  );
  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[i].length; j++) {
      result[j][i] = matrix[i][j];
    }
  }

  return result;
}

/*
1608. Special Array With X Elements Greater Than or Equal X
 */

int specialArray(List<int> nums) {
  for (int i = 0; i <= nums.length; i++) {
    if (isUnique(nums, i)) {
      return i;
    }
  }
  return -1;
}

bool isUnique(List<int> nums, int n) {
  int count = 0;
  for (int i = 0; i < nums.length; i++) {
    if (nums[i] >= n) {
      count++;
    }
  }
  return count == n;
}
/*
3162. Find the Number of Good Pairs I
 */

int numberOfPairs(List<int> nums1, List<int> nums2, int k) {
  int count = 0, n = nums1.length, m = nums2.length;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      if (nums1[i] % (nums2[j] * k) == 0) {
        count++;
      }
    }
  }
  return count;
}

/*
3898. Find the Degree of Each Vertex
 */
List<int> findDegrees(List<List<int>> matrix) {
  List<int> result = [];
  for (int i = 0; i < matrix.length; i++) {
    int count = 0;
    for (int j = 0; j < matrix[i].length; j++) {
      count += matrix[i][j];
    }
    result.add(count);
  }
  return result;
}

/*
3925. Concatenate Array With Reverse
 */
List<int> concatWithReverse(List<int> nums) {
  List<int> result = [];
  for (int i = 0; i < nums.length; i++) {
    result.add(nums[i]);
  }
  for (int i = nums.length - 1; i >= 0; i--) {
    result.add(nums[i]);
  }
  return result;
}

/*
3668. Restore Finishing Order
Thought Process: Putting the friends list in a set for fast lookups O(1),
Looping through the order array and whenever we encounter an element in order and at the same time in the set we add that element to the result list.

Time: O(n).
Space: O(k), where k is the length of friends.
 */
List<int> recoverOrder(List<int> order, List<int> friends) {
  List<int> result = [];
  Set<int> mySet = {};

  for (int i = 0; i < friends.length; i++) {
    mySet.add(friends[i]);
  }

  for (int i = 0; i < order.length; i++) {
    if (mySet.contains(order[i])) {
      result.add(order[i]);
    }
  }
  return result;
}

/*
2396. Strictly Palindromic Number
 */
bool isStrictlyPalindromic(int n) {
  for (int i = 2; i <= n; i++) {
    if (!isPalindromic(n.toRadixString(i))) {
      return false;
    }
  }
  return true;
}

bool isPalindromic(String s) {
  int left = 0, right = s.length - 1;
  while (left < right) {
    if (s[left] != s[right]) {
      return false;
    }
  }
  return true;
}

/*
1769. Minimum Number of Operations to Move All Balls to Each Box
 */
List<int> minOperations(String boxes) {
  List<int> result = [];
  int n = boxes.length;
  for (int i = 0; i < n; i++) {
    int moves = 0;
    for (int j = 0; j < n; j++) {
      if (boxes[i] == '1') {
        moves += (j - i).abs();
      }
    }
    result.add(moves);
  }
  return result;
}

/*
3701. Compute Alternating Sum
Time: O(n)
Space : O(1)
 */
int alternatingSum(List<int> nums) {
  int result = 0, n = nums.length;
  for (int i = 0; i < n; i++) {
    if (i % 2 == 0) {
      result += nums[i];
    } else {
      result -= nums[i];
    }
  }
  return result;
}

/*
1863. Sum of All Subset XOR Totals

Time: O(2^n) --> Number of Subsets
space: O(n) --> recursion depth
 */
int subsetXORSum(List<int> nums) {
  int result = 0;
  void dfs(int i, int currentXOR) {
    if (i == nums.length) {
      result += currentXOR;
      return;
    }
    dfs(i + 1, currentXOR); // Exclude
    dfs(i + 1, currentXOR ^ nums[i]); // Include
  }

  dfs(0, 0);
  return result;
}

/*
3467. Transform Array by Parity
 */
List<int> transformArray(List<int> nums) {
  // Even --> 0
  // Odd --> 1

  for (int i = 0; i < nums.length; i++) {
    nums[i] = (nums[i] % 2 == 0) ? 0 : 1;
  }
  nums.sort();
  return nums;
}

/*
3289. The Two Sneaky Numbers of Digitville
Thought Process: 
1)Use set for fast lookups O(1)
2)Loop through the nums array and for each element if seen before means that it's a duplicate

Time: O(n)
Space: O(n)
 */

List<int> getSneakyNumbers(List<int> nums) {
  List<int> result = [];
  Set<int> set = {};

  for (int i = 0; i < nums.length; i++) {
    if (set.contains(nums[i])) {
      result.add(nums[i]);
      if (result.length == 2) break;
    } else {
      set.add(nums[i]);
    }
  }

  return result;
}

/*
2044. Count Number of Maximum Bitwise-OR Subsets
Time: O(2^n)
Space: O(n), recursion depth
 */
int countMaxOrSubsets(List<int> nums) {
  int result = 0, maxOR = 0;
  for (int i = 0; i < nums.length; i++) {
    maxOR |= nums[i];
  }
  void dfs(int i, int currentOR) {
    if (i == nums.length) {
      if (currentOR == maxOR) result++;
      return;
    }

    dfs(i + 1, currentOR);
    dfs(i + 1, currentOR | nums[i]);
  }

  dfs(0, 0);
  return result;
}

/*
3794. Reverse String Prefix
 */
String reversePrefix(String s, int k) {
  String result = '';
  for (int i = k - 1; i >= 0; i--) {
    result += s[i];
  }
  for (int i = k; i < s.length; i++) {
    result += s[i];
  }
  return result;
}

/*
2657. Find the Prefix Common Array of Two Arrays
There is a better solution
*/
List<int> findThePrefixCommonArray(List<int> A, List<int> B) {
  List<int> result = [];
  for (int i = 0; i < A.length; i++) {
    result.add(getCommonCount(A, B, i));
  }
  return result;
}

int getCommonCount(List<int> A, List<int> B, int l) {
  int count = 0;
  for (int i = 0; i <= l; i++) {
    for (int j = 0; j <= l; j++) {
      if (A[i] == B[j]) {
        count++;
        break;
      }
    }
  }
  return count;
}

/*
2037. Minimum Number of Moves to Seat Everyone
*/

int minMovesToSeat(List<int> seats, List<int> students) {
  seats.sort();
  students.sort();

  int result = 0;
  for (int i = 0; i < students.length; i++) {
    result += (students[i] - seats[i]).abs();
  }
  return result;
}

/*
2125. Number of Laser Beams in a Bank
 */
int numberOfBeams(List<String> bank) {
  List<int> arr = [];
  int result = 0;
  for (int i = 0; i < bank.length; i++) {
    int count = 0;
    for (int j = 0; j < bank[i].length; j++) {
      if (bank[i][j] == '1') {
        count++;
      }
    }
    if (count != 0) {
      arr.add(count);
    }
  }

  for (int i = 1; i < arr.length; i++) {
    result += (arr[i] * arr[i - 1]);
  }
  return result;
}

/*
3264. Final Array State After K Multiplication Operations I
Time:O(K * n)
Space:O(1)
 */
List<int> getFinalState(List<int> nums, int k, int multiplier) {
  for (int i = 0; i < k; i++) {
    nums[getIndexOfMin(nums)] *= multiplier;
  }
  return nums;
}

int getIndexOfMin(List<int> nums) {
  int minIndex = 0, minVal = 999999;
  for (int i = 0; i < nums.length; i++) {
    if (nums[i] < minVal) {
      minIndex = i;
      minVal = nums[i];
    }
  }
  return minIndex;
}

/*
3065. Minimum Operations to Exceed Threshold Value I
Time: O(n)
Space: O(1)
 */
int minOperation(List<int> nums, int k) {
  int count = 0;
  for (int i = 0; i < nums.length; i++) {
    if (nums[i] < k) {
      count++;
    }
  }
  return count;
}

/*
1828. Queries on Number of Points Inside a Circle
 */
List<int> countPoints(List<List<int>> points, List<List<int>> queries) {
  List<int> result = [];
  for (int i = 0; i < queries.length; i++) {
    int count = 0;
    for (int j = 0; j < points.length; j++) {
      double distance = sqrt(
        pow(queries[i][0] - points[j][0], 2) +
            pow(queries[i][1] - points[j][1], 2),
      );
      if (distance <= queries[i][2]) {
        count++;
      }
    }
    result.add(count);
  }

  return result;
}

/*
3895. Count Digit Appearances
Time: O(n)
Space: O(1)

Thought Process: Looping thorugh all elements of the array 'nums'
for each element using the while loop throught each digit in it using the % operation.
 */
int countDigitOccurrences(List<int> nums, int digit) {
  int count = 0;
  for (int i = 0; i < nums.length; i++) {
    int current = nums[i];
    while (current > 0) {
      if (current % 10 == digit) {
        count++;
      }
      current ~/= 10;
    }
  }
  return count;
}

/*
807. Max Increase to Keep City Skyline
Thought Process:

Intuition
To Keep City Skyline, you can to increase the value of any tower as long as it's not longer than any tower in it's row and column.

The tallest building in each row and column defines the skyline. Therefore, each building can be increased up to min(rowMax, colMax) without changing either skyline.

Approach
If our objective in this problem is to make all towers taller(without affecting the skyline which means no tower in it's row or it's column is taller)

Example:
consider the given input
[3,0]
[2,5]
What are the values of the array after increasing the height of buildings without affecting the skyline?

[3, 3]
[3, 5]

So, is that the output ??
no we need to sum up the differece between those grids to get the result.

result = (0 + 3 + 1 + 0) = 4

and return that result.

1.Find the maximum height of every row.
2.Find the maximum height of every column.
3.For each cell, the maximum allowed height is min(rowMax[i], colMax[j]), Add the increase to the answer

Complexity
Time complexity: O(n^2)
Space complexity: O(n)
*/
int maxIncreaseKeepingSkyline(List<List<int>> grid) {
  int result = 0, n = grid.length, m = grid[0].length;

  List<int> maxRows = List.filled(n, 0);
  List<int> maxCols = List.filled(m, 0);

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      maxRows[i] = max(maxRows[i], grid[i][j]);
      maxCols[j] = max(maxCols[j], grid[i][j]);
    }
  }

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      result += min(maxRows[i], maxCols[j]) - grid[i][j];
    }
  }
  return result;
}

/*
1967. Number of Strings That Appear as Substrings in Word 

Thought Process: 
# Intuition

A substring is a contiguous sequence of characters that appears as it is in the given word.

A pattern contributes to the answer only if it appears as a substring of word. We can check each pattern independently using contains().

# Approach
Iterate through every string in patterns  using the function named .contains() to check if that string appeared in any part of the given word

# Complexity
- Time complexity: $$O(n * m)$$
 n: number of patterns
 m: word.length

- Space complexity: $$O(1)$$
*/
int numOfStrings(List<String> patterns, String word) {
  int count = 0;
  for (int i = 0; i < patterns.length; i++) {
    if (word.contains(patterns[i])) {
      count++;
    }
  }
  return count;
}

/*
2610. Convert an Array Into a 2D Array With Conditions
 */

List<List<int>> findMatrix(List<int> nums) {
  Map<int, int> freq = {};
  List<List<int>> result = [];

  for (final num in nums) {
    int row = freq[num] ?? 0;

    if (row == result.length) {
      result.add([]);
    }

    result[row].add(num);
    freq[num] = row + 1;
  }

  return result;
}
